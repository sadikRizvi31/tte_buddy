class SeatModel{
  String PNR;
  bool is_checked;
  bool is_vacant;
  String coach_id;
  String train_no;
  String label;


  SeatModel({
    this.PNR,
    this.is_checked,
    this.is_vacant,
    this.train_no,
    this.coach_id,
    this.label
  });
}