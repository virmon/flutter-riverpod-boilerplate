import 'package:flutter/material.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/app_colors.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  final String avatarImage = 'assets/avatar_placeholder.jpg';
  final String title = 'Studio A - Core';
  final String eventHost = 'Emily Tresk';
  final String hostTitle = 'Instructor';

  final String startsAt = 'July 3, 2025 10:00 AM - 10:55 AM';
  final String duration = '55 minutes';
  final String location = 'Studio A, Street Name, City, Country';

  final String about =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  final List<String> tags = ['Beginner', 'Pilates'];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double currentScrollPosition = _scrollController.position.pixels;
      if (currentScrollPosition >= 230) {
        setState(() {
          _showTitle = true;
        });
      } else {
        setState(() {
          _showTitle = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double titleWidth = screenSize.width * 0.5;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: AnimatedOpacity(
                opacity: _showTitle ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                child: SizedBox(width: titleWidth, child: Text(title)),
              ),
              background: Image.asset(avatarImage, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(avatarImage),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(eventHost),
                          subtitle: Text(hostTitle),
                          trailing: IconButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        avatarImage,
                                        width: 400,
                                        height: 250,
                                        fit: BoxFit.cover,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 16),
                                          Text(
                                            eventHost,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            hostTitle,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(about),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            icon: Icon(Icons.info_outline),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: AppColors.violetC2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(startsAt),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: AppColors.violetC2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(duration),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.place, color: AppColors.violetC2),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(location),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                'About',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(about),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          width: 400,
                          height: 200,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tags',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Wrap(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.violetF6,
                                ),
                                child: Text(
                                  tags[0],
                                  style: TextStyle(color: AppColors.violet99),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.violetF6,
                                ),
                                child: Text(
                                  tags[1],
                                  style: TextStyle(color: AppColors.violet99),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.violetC2,
                                foregroundColor: Colors.white,
                                shadowColor: Colors.grey,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              child: Text('Book'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
