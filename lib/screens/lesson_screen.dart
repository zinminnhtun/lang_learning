import 'package:flutter/material.dart';
import '../theme.dart'; // For AppTheme colors

// TODO: Import an audio player service/provider if currentAudio is used.
// import 'package:audioplayers/audioplayers.dart'; // Example

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int currentStep = 0;
  int totalSteps = 10; // This could be dynamic based on the lesson
  String currentWord = "Hola"; // Example, load dynamically
  String currentTranslation = "Hello"; // Example, load dynamically
  // String currentAudio = "path_to_audio.mp3"; // Example, load dynamically
  // final AudioPlayer _audioPlayer = AudioPlayer(); // If using audioplayers

  // Example lesson content - replace with actual lesson data structure
  // List<Map<String, dynamic>> lessonSteps = [
  //   {'word': 'Hola', 'translation': 'Hello', 'options': ['Hello', 'Goodbye', 'Thank you', 'Please'], 'audio': 'hola.mp3'},
  //   {'word': 'Adiós', 'translation': 'Goodbye', 'options': ['Hello', 'Goodbye', 'Yes', 'No'], 'audio': 'adios.mp3'},
  //   // ... more steps
  // ];

  @override
  void initState() {
    super.initState();
    // Load initial lesson content if necessary
    // _loadStepContent(currentStep); 
  }

  // void _loadStepContent(int stepIndex) {
  //   if (stepIndex < lessonSteps.length) {
  //     setState(() {
  //       currentWord = lessonSteps[stepIndex]['word'];
  //       currentTranslation = lessonSteps[stepIndex]['translation'];
  //       // currentAudio = lessonSteps[stepIndex]['audio'];
  //       // Shuffle options if needed
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson 1: Greetings'), // Title could be dynamic
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(8), // Height of the progress bar
          child: LinearProgressIndicator(
            value: (currentStep + 1) / totalSteps,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Progress text
            Text(
              '${currentStep + 1} of $totalSteps',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 40),
            
            // Main content area
            Expanded(
              child: _buildLessonContent(),
            ),
            
            // Action buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Word card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor, // Use theme
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                currentWord, // From state
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryBlue, // Use theme
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                currentTranslation, // From state
                style: TextStyle(
                  fontSize: 24,
                  color: AppTheme.textSecondary, // Use theme
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              IconButton(
                onPressed: _playAudio,
                icon: const Icon(Icons.volume_up_outlined, size: 40), // Outlined icon
                color: AppTheme.primaryBlue,
                tooltip: 'Play audio',
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        
        // Multiple choice options
        _buildMultipleChoice(),
      ],
    );
  }

  Widget _buildMultipleChoice() {
    // TODO: These options should be dynamic based on the current word/step
    List<String> options = ["Hello", "Goodbye", "Thank you", "Please"];
    // options = lessonSteps[currentStep]['options']; // Example
    // options.shuffle(); // Shuffle for variety

    return Column(
      children: options.map((option) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          child: ElevatedButton(
            onPressed: () => _selectAnswer(option),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).cardColor, // Use theme
              foregroundColor: AppTheme.textPrimary, // Use theme
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[300]!),
              ),
              elevation: 2,
            ),
            child: Text(
              option,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // Add some padding
      child: Row(
        children: [
          if (currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _previousStep,
                style: OutlinedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   side: BorderSide(color: AppTheme.primaryBlue),
                ),
                child: const Text('Previous'),
              ),
            ),
          if (currentStep > 0) const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                 padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(currentStep == totalSteps - 1 ? 'Complete Lesson' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  void _playAudio() async {
    // Implement audio playback using the audioplayers package
    // if (currentAudio.isNotEmpty) {
    //   await _audioPlayer.play(AssetSource(currentAudio)); // Assuming audio is in assets
    // }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Playing audio... (Not implemented)')),
    );
  }

  void _selectAnswer(String answer) {
    // Handle answer selection
    bool isCorrect = answer == currentTranslation; // Compare with current step's translation
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? 'Correct!' : 'Try again!'),
        backgroundColor: isCorrect ? AppTheme.successGreen : Theme.of(context).colorScheme.error,
        duration: Duration(seconds: isCorrect ? 1 : 2),
      ),
    );
    
    if (isCorrect) {
      // Potentially add XP, mark word as learned, etc.
      // context.read<UserProgressProvider>().addXP(10);
      Future.delayed(const Duration(milliseconds: 1200), () { // Slightly longer delay to read "Correct!"
        if (mounted) _nextStep();
      });
    } else {
      // Potentially mark word for review
      // context.read<LearningProvider>().addMistakeWord(currentWord);
    }
  }

  void _nextStep() {
    if (currentStep < totalSteps - 1) {
      setState(() {
        currentStep++;
        // _loadStepContent(currentStep); // Load content for the new step
      });
    } else {
      // Lesson completed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lesson Completed! 🎉'), backgroundColor: AppTheme.successGreen),
      );
      // TODO: Navigate back or to a summary screen
      // Perhaps award XP or update progress
      Navigator.of(context).pop(); 
    }
  }

  void _previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
        // _loadStepContent(currentStep); // Load content for the previous step
      });
    }
  }

  // @override
  // void dispose() {
  //   _audioPlayer.dispose(); // Dispose audio player if used
  //   super.dispose();
  // }
}
