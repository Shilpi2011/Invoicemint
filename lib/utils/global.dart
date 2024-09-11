library global.dart;
import 'package:Invoicemint/model/user_business_list_response.dart';
import 'package:Invoicemint/model/user_client_list_response.dart';


int selectedIndex = 0;
String accessToken = '';

var selectedValue;
int userId = 0;
String? imagePath ;
String?  signaturePath ;


//invoice type index
int selectedScheduleTypeIndex =0;
int selectedBusinessTypeIndex =0;
int selectedInvoiceTypeIndex = 0; 
int? selectedBusinessIndex = 0;


//  invoice Client dropDown 
int clientId = 0;
String  selectedClientName = '';



// invoice BusinessList DropDown
int invoiceId = 0;
int businessId = 0;
String selectedBusinessName='';
String address='';
String cin='';
String companyPan ='';
String gstin='';
String checkStatus='';
String checkSentOn='';
String businessLogo = '';


UserBusinessListResponse? selectedBusiness;
UserClientListResponse? selectedClient;


//MESSAGE ID for schedule reminder
int messageId =0;
String invoiceNo = '';
String invoiceDate = '';
String getInvoiceNo = '';

// user create-invoice List
List createInvoice = [];

//marked as paid Api 
double id = 0.0 ;
double taxAmount = 0.0;
double total = 0.0;
double amountRecived = 0.0;
double transactionCharge = 0.0;
double tds = 0.0;
double tdsWithheld =0.0;
double amountToSettle =0.0;
String InvoiceNo ='';
String billedTo= '';
String paymentDate ='';
String paymentMethod = '';
String notes= ''; 
String paymentStatus = '';
String businessUserId = '';


//Hide & Unhide Fields
String itemName = '';
String taxRate = '';
int fieldId = 0;
int clientHideField = 0;