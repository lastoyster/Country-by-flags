import 'package:flags_app/core/models/flag/flag.dart';
import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flags_app/core/redux/actions/app_action.dart';
import 'package:flags_app/core/redux/actions/navigation_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FlagsPage extends StatefulActionMapper {
  const FlagsPage({super.key});

  @override
  State<FlagsPage> createState() => _FlagsPageState();
}

class _FlagsPageState extends State<FlagsPage> {
  late final TextEditingController _controller;
  late final ValueNotifier<List<Flag>> _flags;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _flags = ValueNotifier(widget.store.state.flags);
  }

  void _onSearch(String text) {
    final searched = widget.store.state.flags.where(
      (e) => e.name.toLowerCase().contains(text.toLowerCase()),
    );
    _flags.value = searched.toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    _flags.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          widget.dispatch(
            const GetFlagsAction(),
          );
          return;
        },
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _controller,
                      onChanged: _onSearch,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: 'Cari negara',
                      ),
                    ),
                  ),
                ),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              ValueListenableBuilder(
                valueListenable: _flags,
                builder: (_, flags, __) {
                  if (flags.isEmpty) {
                    return SliverPadding(
                      padding: EdgeInsets.only(top: height * .2),
                      sliver: const SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 50,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Pencarian tidak ditemukan',
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverMasonryGrid.count(
                      crossAxisCount: 2,
                      childCount: flags.length,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (_, index) {
                        final item = flags[index];

                        return GestureDetector(
                          onTap: () => widget.dispatch(
                            NavigateToNextAction(
                              '/detail-flag',
                              extra: item,
                            ),
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              boxShadow: item.descriptions.isNotEmpty
                                  ? const [
                                      BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 5,
                                        color: Colors.black12,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    item.flag,
                                    style: const TextStyle(
                                      fontSize: 50,
                                    ),
                                  ),
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
