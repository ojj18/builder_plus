import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/Screens/Expense/see_all_transaction.dart';
import 'package:builder_plus/Screens/Project/create_project.dart';
import 'package:builder_plus/Screens/Settings/main.dart';
import 'package:builder_plus/helper/models/expenseModel/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../Component/button/main.dart';
import '../../helper/models/projectModel/main.dart';
import '../../helper/models/vendorModel/main.dart';
import '../../helper/sqlite/db_helper.dart';
import '../../route/main.dart';
import '../Vendor/main.dart';

String expenseTable = "expense_table";

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  DateTime? _datePicker;

  String startDate = "";
  bool isCreditEnable = false;
  bool isDebitEnable = true;
  bool isMoreOptionEnable = false;
  TransferType transferType = TransferType.cash;
  double? amount = 0.0;
  double? total = 0.0;
  double balance = 0.0;
  TextEditingController projectNameController = TextEditingController();
  TextEditingController vendorController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  GlobalKey<FormState> bottomSheetKey = GlobalKey();
  bool isEditContainer = false;

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<ExpenseModel> expenseList = [];
  ExpenseModel expenseModel = ExpenseModel();
  List<ProjectModel> projectList = [];
  List<VendorModel> vendorList = [];

  //date function
  Future _selectDate(BuildContext context) async {
    _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: primaryColor),
              ),
            ),
            child: child!,
          );
        });
    if (_datePicker != null) {
      String formattedDate = DateFormat(
        'dd-MM-yyyy',
      ).format(_datePicker!);

      setState(() {
        startDate = formattedDate;
      });
    } else {
      return null;
    }
  }

  updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) async {
      List<dynamic> todoListFuture =
          await databaseHelper.getTodoList(expenseTable, ExpenseModel.fromJson);
      expenseList = todoListFuture.cast<ExpenseModel>();
      List<dynamic> projectListFuture =
          await databaseHelper.getTodoList(projectTable, ProjectModel.fromJson);
      projectList = projectListFuture.cast<ProjectModel>();
       List<dynamic> vendorListFuture =
          await databaseHelper.getTodoList(vendorTable, VendorModel.fromJson);
      vendorList = vendorListFuture.cast<VendorModel>();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: updateListView(),
        builder: (context, snapShot) {
          return WillPopScope(
            onWillPop: () {
              Get.offAllNamed(RouteSetting.bottomNav);
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: primaryColor,
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()),
                    );
                  },
                  iconSize: 30,
                  icon: const Icon(Icons.menu),
                ),
                centerTitle: true,
                title: const Text(
                  "Builder Pluss",
                  style: LightTheme.header,
                ),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        if (isEditContainer)
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(color: headerColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isEditContainer = !isEditContainer;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: backgroundColor,
                                        )),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              isMoreOptionEnable = false;
                                              showBotton();
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: backgroundColor,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.delete,
                                              color: backgroundColor,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.copy,
                                              color: backgroundColor,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.calendar_today,
                                              color: backgroundColor,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: backgroundColor,
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                          ), //Card
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () {
                                            _selectDate(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                startDate != ""
                                                    ? startDate
                                                    : DateFormat(
                                                        'dd-MM-yyyy',
                                                      ).format(DateTime.now()),
                                                style: LightTheme.subHeader1,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: const Image(
                                                  height: 15,
                                                  width: 15,
                                                  color: backgroundColor,
                                                  image: AssetImage(
                                                      "assets/icons/calender.png"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Total total",
                                      style: LightTheme.subHeader,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "38776.0",
                                          style: LightTheme.subHeader,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "INR",
                                          style: LightTheme.subHeader1,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_downward,
                                                      color:
                                                          Colors.green.shade400,
                                                    ),
                                                    const Text(
                                                      "Income",
                                                      style:
                                                          LightTheme.subHeader1,
                                                    )
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 25.0),
                                                  child: Text(
                                                    "4000.0",
                                                    style:
                                                        LightTheme.subHeader2,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const VerticalDivider(
                                            color: Colors.white,
                                            thickness: 2.5,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_upward,
                                                      color:
                                                          Colors.red.shade400,
                                                    ),
                                                    const Text(
                                                      "Expense",
                                                      style:
                                                          LightTheme.subHeader1,
                                                    )
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 25.0),
                                                  child: Text(
                                                    "1224.0",
                                                    style:
                                                        LightTheme.subHeader2,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //List of transactions
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Recent transactions",
                                    style: LightTheme.header3,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SeeAllTransactionListScreen()),
                                      );
                                    },
                                    child: const Text(
                                      "See all",
                                      style: LightTheme.header2,
                                    ),
                                  )
                                ],
                              ),

                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: expenseList.length,
                                  itemBuilder: ((context, index) {
                                    return InkWell(
                                      onLongPress: () {
                                        int currentIndex = index;
                                        if (currentIndex == index) {
                                          isEditContainer = !isEditContainer;
                                        }
                                        setState(() {});
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(20),
                                            height: 55,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IntrinsicWidth(
                                                  child: Row(
                                                    children: [
                                                      const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        backgroundImage:
                                                            NetworkImage(
                                                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              expenseList[index]
                                                                  .item!),
                                                          Text(
                                                              expenseList[index]
                                                                  .date!),
                                                          // const Text(
                                                          //     "5 quantity * 460 Rs"),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IntrinsicWidth(
                                                        child: Text(
                                                      "INR - ${expenseList[index].amount}",
                                                      style: TextStyle(
                                                        color: expenseList[
                                                                        index]
                                                                    .expenseType ==
                                                                0
                                                            ? Colors
                                                                .green.shade400
                                                            : Colors
                                                                .red.shade400,
                                                      ),
                                                    )))
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: List.generate(
                                                500 ~/ 10,
                                                (index) => Expanded(
                                                      child: Container(
                                                        color: index % 2 == 0
                                                            ? Colors.transparent
                                                            : Colors
                                                                .grey.shade400,
                                                        height: 2,
                                                      ),
                                                    )),
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  isMoreOptionEnable = false;
                  showBotton();
                },
                backgroundColor: primaryColor,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          );
        });
  }

  showBotton() {
    return showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        )),
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: StatefulBuilder(builder: (context, setState) {
              return Form(
                key: bottomSheetKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 10.0, bottom: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isDebitEnable = false;
                                      isCreditEnable = true;
                                      expenseModel.expenseType = 0;
                                    });
                                  },
                                  child: Material(
                                    elevation: isCreditEnable ? 10.0 : 0.0,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                    )),
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: isCreditEnable
                                              ? creditColor
                                              : debitColor.withOpacity(0.65),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            bottomLeft: Radius.circular(25),
                                          )),
                                      child: const Center(
                                          child: Text(
                                        "Income(Credit)",
                                        style: LightTheme.subHeader2,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isCreditEnable = false;
                                      isDebitEnable = true;
                                      expenseModel.expenseType = 1;
                                    });
                                  },
                                  child: Material(
                                    elevation: isDebitEnable ? 10.0 : 0.0,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    )),
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: isDebitEnable
                                              ? creditColor
                                              : debitColor.withOpacity(0.65),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            bottomRight: Radius.circular(25),
                                          )),
                                      child: const Center(
                                          child: Text("Expense(Debit)",
                                              style: LightTheme.subHeader2)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.25,
                                              child: projectList.isNotEmpty
                                                  ? Column(
                                                      children: List.generate(
                                                          projectList.length,
                                                          (index) => InkWell(
                                                                onTap: () {
                                                                  projectNameController
                                                                      .text = projectList[
                                                                          index]
                                                                      .projectClientName!;
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  projectList[
                                                                          index]
                                                                      .projectClientName!,
                                                                  style: LightTheme
                                                                      .subHeader7,
                                                                ),
                                                              )),
                                                    )
                                                  : const Center(
                                                      child: Text(
                                                      "No project found",
                                                      style:
                                                          LightTheme.subHeader7,
                                                    )),
                                            ),
                                            actions: [
                                              InkWell(
                                                onTapDown: (details) {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const CreateProjectScreen()),
                                                  );
                                                },
                                                child: const Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        primaryColor,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Project Name',
                                    hintStyle: LightTheme.subHeader7,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff8F70FF)),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  controller: projectNameController,
                                  onSaved: (value) {
                                    projectNameController.text = value!;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) {
                                            return AlertDialog(
                                              content: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                                child: vendorList.isNotEmpty
                                                    ? Column(
                                                        children: List.generate(
                                                            vendorList.length,
                                                            (index) => InkWell(
                                                                  onTap: () {
                                                                    vendorController
                                                                        .text = vendorList[
                                                                            index]
                                                                        .vendorName!;
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                    vendorList[
                                                                            index]
                                                                        .vendorName!,
                                                                    style: LightTheme
                                                                        .subHeader7,
                                                                  ),
                                                                )),
                                                      )
                                                    : const Center(
                                                        child: Text(
                                                        "No vendor found",
                                                        style: LightTheme
                                                            .subHeader7,
                                                      )),
                                              ),
                                              actions: [
                                                InkWell(
                                                  onTapDown: (details) {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CreateVendorScreen()),
                                                    );
                                                  },
                                                  child: const Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          primaryColor,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Vendor',
                                      hintStyle: LightTheme.subHeader7,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff8F70FF)),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                    ),
                                    controller: vendorController,
                                    onSaved: (value) {
                                      vendorController.text = value!;
                                    }),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Item',
                                      hintStyle: LightTheme.subHeader7,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff8F70FF)),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      itemNameController.text = value!;
                                    }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Amount',
                                      hintStyle: LightTheme.subHeader7,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff8F70FF)),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                    ),
                                    controller: amountController,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        amount = double.parse(value);
                                      }
                                      if (total! > amount!) {
                                        balance = total! - amount!;
                                      }
                                      setState(() {});
                                    },
                                    onSaved: (value) {
                                      amountController.text = value!;
                                    }),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CommonButton(
                            gapWidth: 0,
                            radius: 20,
                            height: 30,
                            width: 100,
                            onButtonTap: () {
                              setState(() {
                                isMoreOptionEnable = !isMoreOptionEnable;
                              });
                            },
                            buttonText: "Vendor Credit",
                            backgroundColor: primaryColor,
                          ),
                          if (isMoreOptionEnable)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            hintText: 'Bill amount',
                                            hintStyle: LightTheme.subHeader7,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff8F70FF)),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.red),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              double totalAmount =
                                                  double.parse(value);
                                              if (totalAmount < amount!) {
                                                return "Amount lesser than total amount";
                                              }
                                            }
                                            return null;
                                          },
                                          controller: totalController,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              total = double.parse(value);
                                            }
                                            if (total! > amount!) {
                                              balance = total! - amount!;
                                            }
                                            setState(() {});
                                          },
                                          onSaved: (value) {
                                            totalController.text = value!;
                                          }),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            balance != 0.0
                                                ? "Balance ${balance.toString()}"
                                                : "",
                                            style: const TextStyle(
                                                fontSize: fontSize16,
                                                color: textFieldLabelTextColor,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Poppins-Regular'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: primaryColor,
                                    value: TransferType.cash,
                                    groupValue: transferType,
                                    onChanged: (TransferType? value) {
                                      setState(() {
                                        transferType = value!;
                                      });
                                    },
                                  ),
                                  const Text("Cash")
                                ],
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: primaryColor,
                                    value: TransferType.bankTranfer,
                                    groupValue: transferType,
                                    onChanged: (TransferType? value) {
                                      setState(() {
                                        transferType = value!;
                                      });
                                    },
                                  ),
                                  const Text("Bank transfer")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: primaryColor,
                                    value: TransferType.cheque,
                                    groupValue: transferType,
                                    onChanged: (TransferType? value) {
                                      setState(() {
                                        transferType = value!;
                                      });
                                    },
                                  ),
                                  const Text("Cheque")
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: formFieldColor.withOpacity(0.2),
                              hintText: 'Notes',
                              hintStyle: LightTheme.subHeader7,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                            ),
                            onSaved: (value) {
                              notesController.text = value!;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IntrinsicWidth(
                                  child: CommonButton(
                                onButtonTap: () {
                                  if (!bottomSheetKey.currentState!
                                      .validate()) {
                                    return;
                                  }
                                  bottomSheetKey.currentState!.save();
                                  _save();
                                  updateListView();
                                  Navigator.pop(context);
                                },
                                radius: 20,
                                height: 30,
                                width: 100,
                                fontSize: fontSize12,
                                gapWidth: 0,
                                backgroundColor: buttonColor,
                                buttonText: "Submit",
                              )),
                              const SizedBox(
                                width: 50.0,
                              ),
                              IntrinsicWidth(
                                  child: CommonButton(
                                onButtonTap: () {
                                  Navigator.pop(context);
                                },
                                radius: 20,
                                height: 30,
                                width: 100,
                                fontSize: fontSize12,
                                gapWidth: 0,
                                backgroundColor: secondaryColor,
                                buttonText: "Cancel",
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }

  void _save() async {
    expenseModel.projectName = projectNameController.text;
    expenseModel.vendor = vendorController.text;
    expenseModel.item = itemNameController.text;
    expenseModel.amount = amount;
    expenseModel.totalAmount = total;
    expenseModel.billAmount = balance;
    expenseModel.notes = notesController.text;
    expenseModel.date = DateFormat.yMMMd().format(DateTime.now());

    expenseModel.paymentType = 1;
    int? result;

    result = await databaseHelper.insertTodo(expenseModel, expenseTable);

    if (result != 0) {
      // Success
    } else {
      // Failure
    }
  }
}
