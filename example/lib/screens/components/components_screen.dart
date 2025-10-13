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
  // Customization state for previews
  double _previewBlur = 20.0;
  double _previewOpacity = 0.15;
  int _selectedGradient = 0;

  final List<List<Color>> _gradients = [
    [Colors.white.withOpacity(0.25), Colors.white.withOpacity(0.1)],
    [Colors.blue.withOpacity(0.25), Colors.cyan.withOpacity(0.12)],
    [Colors.purple.withOpacity(0.25), Colors.pink.withOpacity(0.12)],
    [Colors.grey.withOpacity(0.4), Colors.black.withOpacity(0.2)],
    [Colors.indigo.withOpacity(0.3), Colors.deepPurple.withOpacity(0.15)],
  ];

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
        _buildSectionTitle('Customize Previews'),
        const SizedBox(height: 8),
        _buildCustomizationPanel(),
        const SizedBox(height: 16),
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

  Widget _buildCustomizationPanel() {
    return GlassContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preview Controls',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Blur', style: TextStyle(color: Colors.white70)),
              Expanded(
                child: Slider(
                  min: 0,
                  max: 40,
                  value: _previewBlur,
                  onChanged: (v) => setState(() => _previewBlur = v),
                ),
              ),
              Text(_previewBlur.toInt().toString(), style: const TextStyle(color: Colors.white70)),
            ],
          ),
          Row(
            children: [
              const Text('Opacity', style: TextStyle(color: Colors.white70)),
              Expanded(
                child: Slider(
                  min: 0.0,
                  max: 0.6,
                  value: _previewOpacity,
                  onChanged: (v) => setState(() => _previewOpacity = v),
                ),
              ),
              Text(_previewOpacity.toStringAsFixed(2), style: const TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(_gradients.length, (i) {
              final colors = _gradients[i];
              return GestureDetector(
                onTap: () => setState(() => _selectedGradient = i),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 44,
                  height: 28,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: _selectedGradient == i ? Colors.white : Colors.white24,
                      width: _selectedGradient == i ? 2 : 1,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          // Preview
          GlassContainer(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            blur: _previewBlur,
            opacity: _previewOpacity,
            gradient: LinearGradient(colors: _gradients[_selectedGradient]),
            borderRadius: BorderRadius.circular(16),
            child: Column(
              children: [
                GlassCard(
                  height: 140,
                  blur: _previewBlur,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: _selectedGradient == 3 
                      ? [Colors.black.withOpacity(0.4), Colors.grey.withOpacity(0.2)]
                      : _gradients[_selectedGradient],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.preview,
                            color: _selectedGradient == 3 ? Colors.white70 : Colors.white,
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Glass Card Preview',
                            style: TextStyle(
                              color: _selectedGradient == 3 ? Colors.white70 : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GlassButton(
                  onPressed: () {},
                  blur: _previewBlur,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: _gradients[_selectedGradient]),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.touch_app,
                        color: _selectedGradient == 3 ? Colors.white70 : Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Preview Button',
                        style: TextStyle(
                          color: _selectedGradient == 3 ? Colors.white70 : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
              Row(
                children: [
                  Expanded(
                    child: GlassButton(
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      borderRadius: BorderRadius.circular(25),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.touch_app, color: Colors.white, size: 20),
                            SizedBox(width: 2),
                            Text(
                              'Basic Button',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 16),
                  Expanded(
                    child: GlassButton(
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple.withOpacity(0.4),
                          Colors.blue.withOpacity(0.3),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.gradient, color: Colors.white, size: 20),
                            SizedBox(width: 2),
                            Text(
                              'Gradient',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
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
              Row(
                children: [
                  Expanded(
                    child: GlassButton(
                      onPressed: () => _showGlassDialog(context),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          Colors.teal.withOpacity(0.7),
                          Colors.cyan.withOpacity(0.7),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                            SizedBox(width: 2),
                            Text(
                              'Dialog',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GlassButton(
                      onPressed: () => _showGlassBottomSheet(context),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.withOpacity(0.7),
                          Colors.red.withOpacity(0.7),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.vertical_align_bottom, color: Colors.white, size: 20),
                            SizedBox(width: 2),
                            Text(
                              'Sheet',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
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
        title: const Text(
          'Glass Dialog',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'This is a beautiful glass dialog with enhanced styling and blur effects.',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        actions: [
          GlassButton(
            onPressed: () => Navigator.pop(context),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.red.withOpacity(0.3),
                Colors.pink.withOpacity(0.2),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.close, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Glass Bottom Sheet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This is a beautiful bottom sheet with glassmorphic effects and enhanced styling.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: GlassButton(
                  onPressed: () => Navigator.pop(context),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo.withOpacity(0.3),
                      Colors.purple.withOpacity(0.2),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.close, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
