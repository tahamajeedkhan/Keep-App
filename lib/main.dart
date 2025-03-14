import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NotesHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NoteModel {
  final String title;
  final String content;
  final Color color;
  final Widget child;

  NoteModel({
    required this.title,
    required this.content,
    required this.color,
    required this.child,
  });

  bool contains(String query) {
    return title.toLowerCase().contains(query.toLowerCase()) ||
        content.toLowerCase().contains(query.toLowerCase());
  }
}

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({Key? key}) : super(key: key);

  @override
  _NotesHomePageState createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String _searchQuery = '';
  final FocusNode _searchFocusNode = FocusNode();
  late List<NoteModel> _allNotes;
  late List<NoteModel> _filteredNotes;

  @override
  void initState() {
    super.initState();
    _initializeNotes();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _filterNotes();
    });
  }

  void _filterNotes() {
    if (_searchQuery.isEmpty) {
      _filteredNotes = List.from(_allNotes);
    } else {
      _filteredNotes =
          _allNotes.where((note) => note.contains(_searchQuery)).toList();
    }
  }

  void _initializeNotes() {
    _allNotes = [
      // Names note
      NoteModel(
        title: 'Names',
        content: 'Abdullah Zara Ahmed Mariyum Emaan Arsal',
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abdullah',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Zara',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Ahmed',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Mariyum',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Emaan',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Arsal',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Things to buy note
      NoteModel(
        title: 'Things to buy',
        content:
            'Carry case Fan capacitor Small locks USB Masks box Lighter Detol Extension',
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Text(
                'Things to buy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InteractiveCheckboxListItem(label: 'Carry case'),
                    InteractiveCheckboxListItem(label: 'Fan capacitor'),
                    InteractiveCheckboxListItem(label: 'Small locks (3)'),
                    InteractiveCheckboxListItem(label: 'USB A - C'),
                    InteractiveCheckboxListItem(label: 'Masks box'),
                    InteractiveCheckboxListItem(label: 'Lighter'),
                    InteractiveCheckboxListItem(label: 'Detol'),
                    InteractiveCheckboxListItem(label: 'Extension'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('+ 12 ticked items'),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text('Travel'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // To Do note
      NoteModel(
        title: 'To Do',
        content:
            'Complete Ruby course Prepare WP final paper Complete Flutter course',
        color: const Color(0xFFEED9B9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Text(
                'To Do',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InteractiveCheckboxListItem(label: 'Complete Ruby course'),
                    InteractiveCheckboxListItem(
                        label: 'Prepare WP final paper'),
                    InteractiveCheckboxListItem(
                        label: 'Complete Flutter course'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('+ 1 ticked item'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(Icons.attach_file,
                            color: Colors.white, size: 16),
                        // child: Image.asset('assets/fist 2.jpeg',
                        //width: 16, height: 16),
                      ),
                      const SizedBox(width: 8),
                      const CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assets/profile.jpeg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Before offer questionnaire note
      NoteModel(
        title: 'Before offer questionnaire',
        content:
            'What are your timings? Leaves: annual? casual? sick? Increments policy? Salary disbursement',
        color: const Color(0xFFF8D7E7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Text(
                'Before offer questionnaire',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What are your timings?'),
                  Text('Leaves: annual? casual? sick?'),
                  SizedBox(height: 8),
                  Text('Increments policy?'),
                  SizedBox(height: 8),
                  Text('Salary disbursement date and via what medium?'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Big Wolf note
      NoteModel(
        title: 'Big Wolf',
        content:
            'itnext.io dart flutter Things to remember Enlarge animation is revision CodeMagic Script',
        color: const Color(0xFFDCF8A4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Text(
                'Big Wolf',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'https://itnext.io/dart-before-you-flutter-part-1-71b40e499880',
                      style: TextStyle(color: Colors.green)),
                  SizedBox(height: 16),
                  Text('Things to rememeber'),
                  Text(
                      'Enlarge animation is revision Jan 24, 4:50 PM of Brighten.flr'),
                  SizedBox(height: 16),
                  Text('CodeMagic Script...'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Car maintenance note
      NoteModel(
        title: 'Car maintenance',
        content: 'Car maintenance',
        color: const Color(0xFFD6EDF9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Text(
                'Car maintenance',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    _filteredNotes = List.from(_allNotes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search and profile section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSearching = true;
                          _searchFocusNode.requestFocus();
                        });
                      },
                      child: _isSearching
                          ? TextField(
                              controller: _searchController,
                              focusNode: _searchFocusNode,
                              decoration: InputDecoration(
                                hintText: 'Search your notes',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {
                                      _isSearching = false;
                                    });
                                  },
                                ),
                              ),
                              onSubmitted: (_) {
                                setState(() {
                                  _isSearching = false;
                                });
                              },
                            )
                          : Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: const Text(
                                'Search your notes',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.view_agenda_outlined),
                    onPressed: () {},
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                ],
              ),
            ),

            // Pinned section
            if (_searchQuery.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'PINNED',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // Show search results label when searching
            if (_searchQuery.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SEARCH RESULTS (${_filteredNotes.length})',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // Grid of notes
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _filteredNotes.isEmpty
                    ? const Center(
                        child: Text(
                          'No notes found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: _filteredNotes.length,
                        itemBuilder: (context, index) {
                          return NoteCard(
                            color: _filteredNotes[index].color,
                            child: _filteredNotes[index].child,
                          );
                        },
                      ),
              ),
            ),

            // Bottom navigation
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check_box_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic_none),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.image_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.blue),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final Widget child;
  final Color color;

  const NoteCard({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class InteractiveCheckboxListItem extends StatefulWidget {
  final String label;

  const InteractiveCheckboxListItem({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _InteractiveCheckboxListItemState createState() =>
      _InteractiveCheckboxListItemState();
}

class _InteractiveCheckboxListItemState
    extends State<InteractiveCheckboxListItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              decoration: isChecked ? TextDecoration.lineThrough : null,
              color: isChecked ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
