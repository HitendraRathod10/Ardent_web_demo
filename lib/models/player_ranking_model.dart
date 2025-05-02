class PlayerRankingModel {
  final int rank;
  final String playerName;
  final String city;
  final String tnbaId;
  final int points1;
  final int points2;
  final int points3;
  final int points4;
  final int totalPoints;
  final String imageUrl;

  PlayerRankingModel({
    required this.rank,
    required this.playerName,
    required this.city,
    required this.tnbaId,
    required this.points1,
    required this.points2,
    required this.points3,
    required this.points4,
    required this.totalPoints,
    required this.imageUrl,
  });

  static List<PlayerRankingModel> getDummyData() {
    return List.generate(
      60,
      (index) => PlayerRankingModel(
        rank: index + 1,
        playerName: 'Shubham Soni',
        city: index % 2== 0 ? 'Ahmedabad' : "Pune",
        tnbaId: 'TNBA/00/0004',
        points1: index % 2== 0 ? 100 : 200,
        points2: index % 2== 0 ? 900 : 220,
        points3: index % 2== 0 ? 1000 : 900,
        points4: 1000,
        totalPoints: 1000,
        imageUrl:
        index % 2== 0 ?
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnS1o3mO3S_Nkfw1WAGaRJ6KaOGgODpfoOsA&s"
            :
        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D'
      ),
    );
  }
} 