

import '../../lib_imports.dart';

class ReleaseDate extends StatelessWidget {
  const ReleaseDate({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.withOpacity(0.9),
      ),
      child: Text(
        releaseDate.split('-')[0],
      ),
    );
  }
}
