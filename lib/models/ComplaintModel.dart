class ComplaintModel{
  String complaint_id;
  String PNR;
  String passenger_name;
  String status;
  String description;
  String date;
  String train_no;
  String coach_id;

  ComplaintModel({
    this.complaint_id,
    this.PNR,
    this.passenger_name,
    this.status,
    this.description,
    this.date,
    this.train_no,
    this.coach_id
  });
}