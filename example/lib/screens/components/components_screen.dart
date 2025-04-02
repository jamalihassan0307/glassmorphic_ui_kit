import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import '../../widgets/common/example_screen.dart';

class ComponentsScreen extends StatefulWidget {
  const ComponentsScreen({Key? key}) : super(key: key);

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  double _sliderValue = 0.5;
  bool _switchValue = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExampleScreen(
      title: 'Components Gallery',
      children: [
        _buildSectionTitle('Inputs'),
        _buildInputsSection(),
        const SizedBox(height: 32),
        _buildSectionTitle('Feedback'),
        _buildFeedbackSection(),
        const SizedBox(height: 32),
        _buildSectionTitle('Layout'),
        _buildLayoutSection(),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInputsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        GlassContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buttons',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  GlassButton(
                    onPressed: () {},
                    child: const Text('Basic Button'),
                  ),
                  GlassButton(
                    onPressed: () {},
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.withAlpha(77),
                        Colors.blue.withAlpha(51),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Gradient Button'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Text Fields',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GlassTextField(
                controller: _textController,
                hintText: 'Enter text...',
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
              ),
              const SizedBox(height: 24),
              const Text(
                'Sliders & Switches',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GlassSlider(
                value: _sliderValue,
                onChanged: (value) => setState(() => _sliderValue = value),
              ),
              const SizedBox(height: 16),
              GlassSwitch(
                value: _switchValue,
                onChanged: (value) => setState(() => _switchValue = value),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        GlassContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dialogs & Bottom Sheets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  GlassButton(
                    onPressed: () => _showGlassDialog(context),
                    child: const Text('Show Dialog'),
                  ),
                  GlassButton(
                    onPressed: () => _showGlassBottomSheet(context),
                    child: const Text('Show Bottom Sheet'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Progress Indicators',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlassProgressIndicator(),
                  GlassProgressIndicator(type: GlassProgressType.circular),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLayoutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        GlassContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cards & List Tiles',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const GlassCard(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Glass Card Example',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GlassListTile(
                leading: const Icon(Icons.star, color: Colors.white),
                title: const Text('Glass List Tile'),
                subtitle: const Text('With leading and trailing icons'),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.white70),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showGlassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => GlassDialog(
        title: const Text('Glass Dialog'),
        content: const Text('This is a dialog with a glass effect.'),
        actions: [
          GlassButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showGlassBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassBottomSheet(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Glass Bottom Sheet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This is a bottom sheet with a glass effect.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              GlassButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
