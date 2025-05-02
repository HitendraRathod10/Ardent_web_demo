import 'package:ardent_web_demo/models/player_ranking_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  String? selectedCategory = "Men's Singles";
  String? selectedAge = "All";
  String? selectedYear = "Pick A Date";
  final List<PlayerRankingModel> rankings = PlayerRankingModel.getDummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'TNBA RANKING',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search, color: Colors.grey[400], size: 20),
                              const SizedBox(width: 8),
                              Container(
                                height: 20,
                                width: 1,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Category',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown(
                          'Select Category',
                          selectedCategory,
                          ['Men\'s Singles'],
                          (value) => setState(() => selectedCategory = value),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildDropdown(
                          'Select Age Category',
                          selectedAge,
                          ['All'],
                          (value) => setState(() => selectedAge = value),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildDropdown(
                          'Pick A Date',
                          selectedYear,
                          ['Pick A Date'],
                          (value) => setState(() => selectedYear = value),
                          icon: Icons.calendar_today,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.refresh, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 130),
            _buildTopThree(),
            // const SizedBox(height: 30),
            _buildRankingTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String hint,
      String? value,
      List<String> items,
      Function(String?) onChanged, {
        IconData? icon,
      }) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.grey[400], size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              hint,
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
          ],
        ),
        value: value,
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        )
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[800]!),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(8),
            thickness: MaterialStateProperty.all(4),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
      ),
    );
  }


  Widget _buildTopThree() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: _buildTopPlayer(rankings[1], 2, const Color(0xFFB71C1C)),
          ),
          const SizedBox(width: 30),
          Expanded(flex: 2, child: _buildTopPlayer(rankings[0], 1, Colors.red)),
          const SizedBox(width: 30),
          Expanded(
            flex: 1,
            child: _buildTopPlayer(rankings[2], 3, const Color(0xFF8B0000)),
          ),
        ],
      ),
    );
  }

  Widget _buildTopPlayer(PlayerRankingModel player, int position, Color color) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Player card container
        Container(
          margin: const EdgeInsets.only(top: 50),
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding:  EdgeInsets.only(
            top: position == 1 ? 90 : 60,
            bottom: 20,
            left: 12,
            right: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '#$position ${player.playerName}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                player.city,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              Text(
                'TNBA Points: ${player.totalPoints}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // Player image
        Positioned(
          top: -50,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            width: 200,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(player.imageUrl, fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ScrollController _scrollController = ScrollController();

  Widget _buildRankingTable() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          thickness: 6,
          radius: const Radius.circular(8),
          interactive: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Theme(
              data: Theme.of(context).copyWith(
                dataTableTheme: DataTableThemeData(
                  headingTextStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  dataTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  headingRowColor: MaterialStateProperty.all(Colors.grey[850]),
                  dataRowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text('Rank')),
                  DataColumn(label: Text('Player Profile')),
                  DataColumn(label: Text('TNBA ID')),
                  DataColumn(label: Text("C'ship 24")),
                  DataColumn(label: Text('Namkal 29.1.25')),
                  DataColumn(label: Text('Che 3.4.24')),
                  DataColumn(label: Text('Namkal 27.6.24')),
                  DataColumn(label: Text('Total Points')),
                ],
                rows: rankings.map((player) {
                  Color? backgroundColor;
                  if (player.rank == 1) backgroundColor = Colors.red[800];
                  if (player.rank == 2) backgroundColor = Colors.red[700];
                  if (player.rank == 3) backgroundColor = Colors.red[900];
                  return DataRow(
                    cells: [
                      DataCell(
                        Container(
                          width: double.infinity,
                          color: backgroundColor,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${player.rank}.',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (player.rank == 1) ...[
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.arrow_upward,
                                  color: Colors.green,
                                  size: 16,
                                ),
                                const Text(
                                  '+4',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(player.imageUrl),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  player.playerName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Ahmedabad',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      DataCell(Text(player.tnbaId)),
                      DataCell(Text(player.points1.toString())),
                      DataCell(Text(player.points2.toString())),
                      DataCell(Text(player.points3.toString())),
                      DataCell(Text(player.points4.toString())),
                      DataCell(
                        Text(
                          player.totalPoints.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
    }


}
