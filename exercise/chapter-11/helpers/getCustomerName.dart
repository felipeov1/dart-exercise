String getCustomerName(List<dynamic> customers, int id) {
  for (var customer in customers) {
    if (customer['Cod_Cli'] == id) {
      return customer['Nome'];
    }
  }
  return 'Unknown';
}