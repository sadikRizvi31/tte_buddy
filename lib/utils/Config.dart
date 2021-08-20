import 'dart:core';

class Config {
  static String strBaseURL =
      "";
      // "https://www.something.com/api/";

  static String token =
      "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1OTAxMjcwOTYsImV4cCI6MTkwNTQ4NzA5NiwiaXNzIjoiaHR0cDovL2RlZmF1bHRub3BmbHV0dGVyc3RhZ2luZy5mb3JlZnJvbnRpbmZvdGVjaC5jb20iLCJhdWQiOlsiaHR0cDovL2RlZmF1bHRub3BmbHV0dGVyc3RhZ2luZy5mb3JlZnJvbnRpbmZvdGVjaC5jb20vcmVzb3VyY2VzIiwibm9wX2FwaSJdLCJjbGllbnRfaWQiOiI4NmQ2ZmQ5Yy1lZWEzLTRlZjUtYjIyOC01YTEwYTA5MjJiNTkiLCJzdWIiOiI4NmQ2ZmQ5Yy1lZWEzLTRlZjUtYjIyOC01YTEwYTA5MjJiNTkiLCJhdXRoX3RpbWUiOjE1OTAxMjcwOTQsImlkcCI6ImxvY2FsIiwic2NvcGUiOlsibm9wX2FwaSIsIm9mZmxpbmVfYWNjZXNzIl0sImFtciI6WyJwd2QiXX0.RFYzLRgOighBeyfzpwLrBP1thAbU9nyzM68cXwr7UFfsWCFutC_cuqe8HE5nr1IqPdDo6k9qNu-7jNgLd1BdsffRDvSHQcFiOpMmdzQqvmqTgNKkFCJgOxhGQnOUnH_y4p8oazXt7oYAkpu7hU_2OpmVKD3oiQ6Sa0oRJsxARyPZtSb8gRfIW3m_sVo932LSQUM08rZH5GH2X2k2pVLtrE3cgjz2v9Eb_47LmM-p9s43YXLTxBJtEs7GMQW-1KvDnfSx1HiGr9cwQbybrtb-20R4l24GEbL3c8ULUFt-ANJxQLsh68YHYyFI7PlBURLKTwQG4l681yEqT-PNs7eeVA";
  static var httpGetHeader = {
    "Authorization": token,
    "Accept": "application/json",
    "Content-type": "application/json"
  };

  static var httpPostHeader = {
    "Authorization": token,
    "Accept": "application/json",
    "Content-type": "application/json"
  };

  static var httpPostHeaderForEncode = {
    "Authorization": token,
    "Accept": "application/json",
    "Content-type": "application/x-www-form-urlencoded"
  };
}
