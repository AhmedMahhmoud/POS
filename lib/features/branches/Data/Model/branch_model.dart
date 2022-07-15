class BranchModel {
  int id;
  String branchName;
  String branchNum;
  String branchAddress;
  BranchModel({
    required this.id,
    required this.branchName,
    required this.branchNum,
    required this.branchAddress,
  });

  factory BranchModel.fromJson(json) {
    return BranchModel(
        id: json['id'],
        branchName: json['name'],
        branchNum: json['brachNo'],
        branchAddress: json['address']);
  }
}
