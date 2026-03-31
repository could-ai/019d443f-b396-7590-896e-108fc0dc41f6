import 'package:flutter/material.dart';

void main() {
  runApp(const LogoApp());
}

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Company Logo Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LogoShowcaseScreen(),
      },
    );
  }
}

class LogoShowcaseScreen extends StatefulWidget {
  const LogoShowcaseScreen({super.key});

  @override
  State<LogoShowcaseScreen> createState() => _LogoShowcaseScreenState();
}

class _LogoShowcaseScreenState extends State<LogoShowcaseScreen> {
  String companyName = "Your Company";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Logo Designs', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "I've designed a few logo concepts using Flutter. You can use these directly in your app!",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            
            // Editable Company Name
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your company name',
                prefixIcon: const Icon(Icons.business),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  companyName = value.isEmpty ? "Your Company" : value;
                });
              },
            ),
            const SizedBox(height: 32),

            // Concept 1: Modern Tech
            _buildLogoCard(
              title: "Concept 1: Modern Tech",
              logo: ModernTechLogo(companyName: companyName),
            ),
            const SizedBox(height: 24),

            // Concept 2: Elegant Corporate
            _buildLogoCard(
              title: "Concept 2: Elegant Corporate",
              logo: ElegantCorporateLogo(companyName: companyName),
            ),
            const SizedBox(height: 24),

            // Concept 3: Creative & Playful
            _buildLogoCard(
              title: "Concept 3: Creative Studio",
              logo: CreativeLogo(companyName: companyName),
            ),
            const SizedBox(height: 24),
            
            // Concept 4: Minimalist
            _buildLogoCard(
              title: "Concept 4: Minimalist",
              logo: MinimalistLogo(companyName: companyName),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoCard({required String title, required Widget logo}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          logo,
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ==========================================
// LOGO DESIGNS
// ==========================================

class ModernTechLogo extends StatelessWidget {
  final String companyName;
  const ModernTechLogo({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0072FF).withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.rocket_launch_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          companyName.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            color: Color(0xFF1A1A24),
          ),
        ),
      ],
    );
  }
}

class ElegantCorporateLogo extends StatelessWidget {
  final String companyName;
  const ElegantCorporateLogo({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.account_balance,
          color: Color(0xFF1E3A8A), // Deep Blue
          size: 48,
        ),
        const SizedBox(height: 8),
        Text(
          companyName,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            fontFamily: 'Georgia', // Serif-like fallback
            color: Color(0xFF1E3A8A),
            letterSpacing: 0.5,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 2,
          width: 40,
          color: const Color(0xFFD4AF37), // Gold accent
        ),
      ],
    );
  }
}

class CreativeLogo extends StatelessWidget {
  final String companyName;
  const CreativeLogo({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: 0.2,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4B2B),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Transform.rotate(
              angle: -0.2,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF416C).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Icon(
              Icons.palette,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Text(
          companyName,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            color: Color(0xFFFF416C),
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}

class MinimalistLogo extends StatelessWidget {
  final String companyName;
  const MinimalistLogo({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    // Get first letter for the logo mark
    String firstLetter = companyName.isNotEmpty ? companyName[0].toUpperCase() : "C";

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 3),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            firstLetter,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          companyName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300, // Light weight for minimalist look
            letterSpacing: 3.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
