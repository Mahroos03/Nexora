class QualificationItem {
  final String title;
  final String institution;
  final String year;
  final String details;

  const QualificationItem({
    required this.title,
    required this.institution,
    required this.year,
    required this.details,
  });
}

class MemberData {
  final int id;
  final String fullName;
  final String shortName;
  final String role;
  final String bio;
  final String email;
  final String address;
  final String phone;
  final List<QualificationItem> qualifications;
  final List<String> softSkills;
  final List<String> specialTalents;
  final List<String> technicalSkills;
  final String avatarUrl;

  const MemberData({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.role,
    required this.bio,
    required this.email,
    required this.address,
    required this.phone,
    required this.qualifications,
    required this.softSkills,
    required this.specialTalents,
    required this.technicalSkills,
    required this.avatarUrl,
  });
}

class NexoraMembers {
  static const List<MemberData> list = [
    MemberData(
      id: 1,
      fullName: 'Mohamed Mahroos',
      shortName: 'Mahroos',
      role: 'Full Stack & Mobile Developer',
      bio: 'Enthusiastic IT undergraduate with a passion for architecting resilient cross-platform apps, cloud infrastructure, and distributed systems.',
      email: 'mahroos@nexora.dev',
      address: 'Main Street, Erukkalampitty, Mannar, Sri Lanka',
      phone: '+94 77 123 4561',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Specializing in Software Systems, Networking & Cloud Platforms.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Physical Science)',
          institution: 'P/Erukkalampitty M.M.V.',
          year: '2022',
          details: 'Combined Maths, Physics, Chemistry with District Distinction.',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'P/Erukkalampitty M.M.V.',
          year: '2019',
          details: '9 As with High Honors in Mathematics and Science.',
        ),
        QualificationItem(
          title: 'Professional Certificate in Flutter Development',
          institution: 'Google Developers Ecosystem Academy',
          year: '2024',
          details: 'State management, architecture and production deployment.',
        ),
      ],
      softSkills: [
        'Strategic Leadership',
        'Complex Problem Solving',
        'Cross-functional Teamwork',
        'Technical Communication',
        'Time & Sprint Management',
        'Critical Thinking',
      ],
      specialTalents: [
        'Football (College Team Captain)',
        'Tech Blogging & Open Source',
        'Competitive Algorithmic Coding',
        'Cybersecurity & Capture-the-Flag',
      ],
      technicalSkills: [
        'Flutter', 'Dart', 'Java', 'Spring Boot', 'React',
        'Firebase', 'PostgreSQL', 'Docker', 'Git'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 2,
      fullName: 'Dilki Nanayakkara',
      shortName: 'Dilki',
      role: 'UI/UX Specialist & Frontend Developer',
      bio: 'Detail-oriented designer and front-end engineer crafting delightful, accessible user journeys and micro-interactions.',
      email: 'dilki.n@nexora.dev',
      address: 'Galle Road, Kalutara North, Sri Lanka',
      phone: '+94 71 890 1234',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Focus on Human-Computer Interaction, UI Design & Mobile Development.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Bio Science)',
          institution: 'Kalutara Balika Vidyalaya',
          year: '2022',
          details: 'Biology, Chemistry, Physics with excellent academic standing.',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Kalutara Balika Vidyalaya',
          year: '2019',
          details: '8 As and 1 B including English & Mathematics Distinction.',
        ),
        QualificationItem(
          title: 'Google UX Design Professional Certificate',
          institution: 'Coursera / Google Career Certificates',
          year: '2024',
          details: 'User Research, Wireframing, Figma Prototypes & Design Systems.',
        ),
      ],
      softSkills: [
        'Empathy & User Advocacy',
        'Interpersonal Communication',
        'Creative Brainstorming',
        'Team Collaboration',
        'Attention to Detail',
        'Adaptability',
      ],
      specialTalents: [
        'Digital Art & Vector Illustration',
        'Violin & Western Classical Music',
        'Creative Copywriting',
        'Photography & Visual Styling',
      ],
      technicalSkills: [
        'Figma', 'Flutter UI', 'Adobe XD', 'HTML5/CSS3',
        'Tailwind', 'Design Systems', 'Micro-animations'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 3,
      fullName: 'M. Dismini Mihirandani',
      shortName: 'Dismini',
      role: 'Software Engineer & QA Enthusiast',
      bio: 'Committed to building clean, maintainable software systems and reliable automated test suites with high code quality standards.',
      email: 'dismini.m@nexora.dev',
      address: 'Bandaranayake Mawatha, Kurunegala, Sri Lanka',
      phone: '+94 76 543 2198',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Specializing in Enterprise Systems, Database Management & QA.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Physical Science)',
          institution: 'Maliyadeva Balika Vidyalaya, Kurunegala',
          year: '2022',
          details: 'Passed with high marks in Mathematics and ICT streams.',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Maliyadeva Balika Vidyalaya',
          year: '2019',
          details: '9 As with Island Merit Ranking Recognition.',
        ),
        QualificationItem(
          title: 'Certificate in Automated Software Testing',
          institution: 'SLIIT Professional Academy',
          year: '2024',
          details: 'Selenium, JUnit, Test Automation & CI/CD Pipeline Integration.',
        ),
      ],
      softSkills: [
        'Analytical Thinking',
        'Active Listening',
        'Conflict Resolution',
        'Organized Documentation',
        'Patience & Quality Focus',
        'Agile Methodology',
      ],
      specialTalents: [
        'Badminton (Provincial Championship Semifinalist)',
        'Traditional Dance (Kandyan Cultural Troupe)',
        'Chess Strategy & Tournaments',
        'Public Speaking & Debating',
      ],
      technicalSkills: [
        'Dart', 'Java', 'C++', 'SQL', 'Git',
        'Selenium', 'Postman', 'Flutter', 'Firebase'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 4,
      fullName: 'Imal Lakshitha',
      shortName: 'Imal',
      role: 'Backend Architect & Database Engineer',
      bio: 'Enthusiastic backend engineer dedicated to high-throughput data processing, relational databases, and serverless architectures.',
      email: 'imal.lakshitha@nexora.dev',
      address: 'Hospital Road, Matara, Sri Lanka',
      phone: '+94 77 345 6789',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Advanced Datastructures, Cloud Architecture & Scalability.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Physical Science)',
          institution: 'Rahula College, Matara',
          year: '2022',
          details: 'Combined Mathematics, Physics, Chemistry.',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Rahula College, Matara',
          year: '2019',
          details: 'Distinction in all core science and technical subjects (9 As).',
        ),
        QualificationItem(
          title: 'AWS Certified Cloud Practitioner',
          institution: 'Amazon Web Services',
          year: '2024',
          details: 'Cloud concepts, security, architecture, and billing.',
        ),
      ],
      softSkills: [
        'Logical Troubleshooting',
        'Team Mentorship',
        'Decision Making Under Pressure',
        'Agile Sprint Planning',
        'Collaborative Problem Solving',
      ],
      specialTalents: [
        'Acoustic Guitar & Music Production',
        'Table Tennis (Inter-School Runner-up)',
        'Open-Source Hardware & Arduino Tinkering',
        'Gaming & Esports Coordination',
      ],
      technicalSkills: [
        'Node.js', 'Python', 'Go', 'PostgreSQL',
        'Redis', 'REST APIs', 'Docker', 'Linux/Bash'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 5,
      fullName: 'Naduni Vimadhya',
      shortName: 'Naduni',
      role: 'Product Designer & Frontend Engineer',
      bio: 'Bridging technical code with emotional design. Passionate about creating visually captivating apps and memorable brand experiences.',
      email: 'naduni.v@nexora.dev',
      address: 'Temple Road, Negombo, Sri Lanka',
      phone: '+94 70 234 5678',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Multimedia Technologies, Graphic Design & App Development.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Technology Stream)',
          institution: 'Newstead Girls College, Negombo',
          year: '2022',
          details: 'Information Communication Technology, Science for Technology.',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Newstead Girls College, Negombo',
          year: '2019',
          details: 'Graduated with 9 As including Art & Literature awards.',
        ),
        QualificationItem(
          title: 'Diploma in Graphic Design & 3D Animation',
          institution: 'AMDT School of Creativity',
          year: '2023',
          details: 'Visual branding, typography, color theory and rendering.',
        ),
      ],
      softSkills: [
        'Creative Expression',
        'Empathetic Communication',
        'Workplace Adaptability',
        'Cross-cultural Collaboration',
        'Time Management',
      ],
      specialTalents: [
        'Classical Vocalist & Singing',
        'Canvas Painting & Watercolor Art',
        'UI Motion Graphics & Animation',
        'Event Management & Stage Coordination',
      ],
      technicalSkills: [
        'Flutter UI', 'Dart', 'Figma', 'Adobe Illustrator',
        'Photoshop', 'CSS3/Sass', 'Lottie Animations'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 6,
      fullName: 'Nimthaka Bandara',
      shortName: 'Nimthaka',
      role: 'Mobile Systems & IoT Engineer',
      bio: 'Enthusiastic about connecting physical hardware with intuitive mobile applications through BLE, MQTT and reactive Flutter architectures.',
      email: 'nimthaka.b@nexora.dev',
      address: 'Peradeniya Road, Kandy, Sri Lanka',
      phone: '+94 78 901 2345',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Hardware Interfacing, Microcontrollers & Mobile Computing.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Physical Science)',
          institution: 'Kingswood College, Kandy',
          year: '2022',
          details: 'Physical Science stream with high merit passes.',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Kingswood College, Kandy',
          year: '2019',
          details: '9 As with Senior School Cadet Platoon Honors.',
        ),
        QualificationItem(
          title: 'Certificate in Embedded Systems & IoT',
          institution: 'University of Colombo School of Computing (UCSC)',
          year: '2024',
          details: 'ESP32, Sensor Fusion, MQTT and Smart Home Prototypes.',
        ),
      ],
      softSkills: [
        'Team Leadership & Morale',
        'Hands-on Rapid Prototyping',
        'Structured Time Management',
        'Technical Mentoring',
        'Perseverance in Debugging',
      ],
      specialTalents: [
        'Cricket (College 1st XI Team All-Rounder)',
        'Hiking & Mountain Trekking (Knuckles Leader)',
        'Robotics Competition Finalist',
        'Drone Piloting & Videography',
      ],
      technicalSkills: [
        'Flutter', 'C / C++', 'Python', 'Arduino',
        'MQTT', 'Bluetooth Low Energy', 'Firebase'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 7,
      fullName: 'Pamodya Nethmi',
      shortName: 'Pamodya',
      role: 'DevOps & Cloud Security Analyst',
      bio: 'Passionate about building bulletproof deployment workflows, cloud infrastructure, container orchestration, and continuous compliance.',
      email: 'pamodya.n@nexora.dev',
      address: 'Havelock Road, Colombo 05, Sri Lanka',
      phone: '+94 77 654 3210',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Information Security, Systems Administration & Cloud Engineering.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Physical Science)',
          institution: 'Visakha Vidyalaya, Colombo',
          year: '2022',
          details: 'Combined Maths, Chemistry, Physics (District Rank top 50).',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Visakha Vidyalaya, Colombo',
          year: '2019',
          details: '9 As with All-Island English Essay Prize.',
        ),
        QualificationItem(
          title: 'Certified Kubernetes Administrator (CKA) Training',
          institution: 'Linux Foundation / CNCF',
          year: '2024',
          details: 'Cluster architecture, workload scheduling and networking.',
        ),
      ],
      softSkills: [
        'Proactive Organization',
        'Diplomatic Communication',
        'High Attention to Detail',
        'Critical Risk Assessment',
        'Continuous Self-Learning',
      ],
      specialTalents: [
        'Keyboard & Piano (Trinity College London Grade 6)',
        'Creative Non-Fiction Writing & Poetry',
        'Archery & Target Sports',
        'Debate & Parliamentary Adjudication',
      ],
      technicalSkills: [
        'Docker', 'Kubernetes', 'GitHub Actions', 'Linux',
        'Terraform', 'Python', 'Bash Scripting', 'Flutter'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 8,
      fullName: 'Rukshan Mohottige',
      shortName: 'Rukshan',
      role: 'Cross-Platform Mobile & Games Engineer',
      bio: 'Energetic software craftsman creating hyper-responsive interactive experiences, 60fps animations, and mobile games.',
      email: 'rukshan.m@nexora.dev',
      address: 'Station Road, Gampaha, Sri Lanka',
      phone: '+94 75 432 1098',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Game Engine Architecture, Mobile Graphics & Computer Vision.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Technology Stream)',
          institution: 'Bandaranayake College, Gampaha',
          year: '2022',
          details: 'Engineering Technology, Science for Tech & ICT (3 As).',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Bandaranayake College, Gampaha',
          year: '2019',
          details: '9 As with Western Province ICT Competition Winner.',
        ),
        QualificationItem(
          title: 'Unity Certified Associate Game Developer',
          institution: 'Unity Technologies',
          year: '2024',
          details: 'C# scripting, 2D/3D physics, particle systems, shader graphs.',
        ),
      ],
      softSkills: [
        'High Energy Leadership',
        'Fast Iteration & Prototyping',
        'Collaborative Brainstorming',
        'Resilience Under Tight Deadlines',
        'User Psychology Analysis',
      ],
      specialTalents: [
        'Basketball (Provincial Championship Gold Medalist)',
        '3D Game Design & Shader Programming',
        'Swimming & Lifesaving Certification',
        'Beatboxing & Electronic Music Synthesizers',
      ],
      technicalSkills: [
        'Flutter', 'Dart', 'Unity 3D', 'C#',
        'Flame Engine', 'OpenGL/GLSL', 'Blender'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&w=400&q=80',
    ),
    MemberData(
      id: 9,
      fullName: 'Buddhika Sandaru',
      shortName: 'Sandaru',
      role: 'Full Stack Web & Data Science Specialist',
      bio: 'Passionate about extracting actionable insights from complex datasets and building beautiful, responsive interactive dashboards.',
      email: 'sandaru.b@nexora.dev',
      address: 'Wackwella Road, Galle, Sri Lanka',
      phone: '+94 72 345 6781',
      qualifications: [
        QualificationItem(
          title: 'National Diploma in Technology (NDT) in IT',
          institution: 'Institute of Technology, University of Moratuwa',
          year: '2023 - Present',
          details: 'Data Science, Machine Learning, Web Technologies & Statistics.',
        ),
        QualificationItem(
          title: 'G.C.E. Advanced Level (Physical Science)',
          institution: 'Richmond College, Galle',
          year: '2022',
          details: 'Combined Maths, Physics, Chemistry with First Class Honors.',
        ),
        QualificationItem(
          title: 'G.C.E. Ordinary Level',
          institution: 'Richmond College, Galle',
          year: '2019',
          details: '9 As with General Knowledge Trophy.',
        ),
        QualificationItem(
          title: 'IBM Data Science Professional Certificate',
          institution: 'IBM / Coursera',
          year: '2024',
          details: 'Python, Pandas, Scikit-Learn, SQL, Data Visualization.',
        ),
      ],
      softSkills: [
        'Analytical Rigor',
        'Clear Data Storytelling',
        'Active Team Player',
        'Methodical Organization',
        'Curiosity & Research Driven',
      ],
      specialTalents: [
        'Surfing & Ocean Water Sports (Southern Coast)',
        'Nature & Landscape Wildlife Photography',
        'Astronomy & Stargazing Astrophotography',
        'Rubik\'s Cube Speedcubing (Sub-20s)',
      ],
      technicalSkills: [
        'Python', 'Pandas', 'Flutter', 'Dart',
        'FastAPI', 'PostgreSQL', 'Scikit-learn', 'Tableau'
      ],
      avatarUrl: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?auto=format&fit=crop&w=400&q=80',
    ),
  ];

  static MemberData getById(int id) {
    return list.firstWhere(
      (m) => m.id == id,
      orElse: () => list.first,
    );
  }
}
