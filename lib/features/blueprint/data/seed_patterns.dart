import 'package:life_pattern/features/blueprint/domain/pattern_template.dart';

List<PatternTemplate> getSeedPatterns() {
  return [
    // -------------------------------------------------------------------------
    // CORE SELF
    // -------------------------------------------------------------------------
    const PatternTemplate(
      id: 'core_intense_inner_world',
      category: 'core_self',
      title: 'Intense Inner World',
      shortDescription:
          'You experience emotions with profound depth and intensity.',
      longDescription:
          'Your emotional landscape is vast and deep. You don\'t just feel things; you absorb them. This intensity is your superpower, allowing for great empathy and creativity, but it can also be overwhelming. You likely need time alone to process your feelings and may find superficial interactions draining.\n\nHonoring this depth is crucial. Don\'t let others tell you you\'re "too sensitive." Your sensitivity is an antenna for truth and beauty.',
      reflectionPrompts: [
        'When was the last time you felt truly understood?',
        'How do you recharge after an emotionally intense day?',
        ' what creative outlet helps you express your inner world?'
      ],
      iconName: 'water_drop',
    ),
    const PatternTemplate(
      id: 'core_independent_spirit',
      category: 'core_self',
      title: 'Independent Spirit',
      shortDescription: 'Freedom and autonomy are your non-negotiables.',
      longDescription:
          'You march to the beat of your own drum. Constraints, whether from relationships, jobs, or societal norms, feel suffocating to you. You thrive when you can define your own path and make your own rules.\n\nThis independence isn\'t just about being alone; it\'s about self-governance. You need to feel that your choices are truly yours. Watch out for a tendency to push people away when you feel your freedom is threatened.',
      reflectionPrompts: [
        'In what area of your life do you feel most restricted right now?',
        'How can you cultivate more freedom in your daily routine?',
        'Does your need for independence ever lead to isolation?'
      ],
      iconName: 'flight',
    ),
    const PatternTemplate(
      id: 'core_analytical_mind',
      category: 'core_self',
      title: 'Analytical Mind',
      shortDescription: 'You see the world as a system to be understood.',
      longDescription:
          'Your mind is a razor-sharp tool. You naturally dissect problems, look for patterns, and seek logical explanations. You value clarity and precision, often finding comfort in data and facts over messy emotions.\n\nWhile this gift serves you well in complex tasks, remember that not everything can be solved. Sometimes, life asks to be experienced, not analyzed. Allow yourself moments of wonder where logic takes a back seat.',
      reflectionPrompts: [
        'What is a puzzle you are currently trying to solve?',
        'Do you sometimes struggle to turn your brain off?',
        'How can you balance your logic with intuition?'
      ],
      iconName: 'psychology',
    ),
    const PatternTemplate(
      id: 'core_empathic_nature',
      category: 'core_self',
      title: 'Empathic Nature',
      shortDescription: 'You are highly attuned to the emotions of others.',
      longDescription:
          'You walk into a room and instantly sense the mood. You absorb the joys and sorrows of those around you, often confusing their feelings with your own. This makes you an incredible friend and healer, but it requires strong boundaries.\n\nLearning to distinguish "me" from "them" is your lifelong lesson. Your empathy is a gift, but you must protect your energy to keep giving it.',
      reflectionPrompts: [
        'Who in your life drains your energy?',
        'How do you set boundaries to protect your emotional space?',
        'Describe a time your intuition about someone was right.'
      ],
      iconName: 'favorite',
    ),
    const PatternTemplate(
      id: 'core_creative_expression',
      category: 'core_self',
      title: 'Creative Expression',
      shortDescription: 'You have a strong need for artistic output.',
      longDescription:
          'Creation isn\'t a hobby for you; it\'s a biological need. Whether through art, writing, code, or gardening, you must bring something new into the world to feel alive. When you block this flow, you may feel stagnant or anxious.\n\nYour creativity is your voice. Don\'t worry about the outcome or public approval. The act of making is where your healing lies.',
      reflectionPrompts: [
        'What did you love creating as a child?',
        'What project have you been putting off starting?',
        'How does creating make you feel physically?'
      ],
      iconName: 'palette',
    ),

    // -------------------------------------------------------------------------
    // GROWTH
    // -------------------------------------------------------------------------
    const PatternTemplate(
      id: 'growth_healing_wounds',
      category: 'growth',
      title: 'Healing Old Wounds',
      shortDescription: 'You are in a cycle of processing past experiences.',
      longDescription:
          'The past is asking for your attention. Old memories, hurts, or patterns may be resurfacing now. This isn\'t to punish you, but to free you. You are ready to look at what has been hidden and integrate it.\n\nThis process can be heavy, but the lightness on the other side is worth it. Be gentle with yourself. You are doing deep subterranean work.',
      reflectionPrompts: [
        'What memory keeps coming back to you lately?',
        'What would you say to your younger self?',
        'How have your past challenges made you stronger?'
      ],
      iconName: 'healing',
    ),
    const PatternTemplate(
      id: 'growth_building_confidence',
      category: 'growth',
      title: 'Building Confidence',
      shortDescription: 'Overcoming self-doubt and stepping into your power.',
      longDescription:
          'You are learning to trust yourself. For too long, you may have looked outside for validation. Now, the stars are aligning to help you find that validation within. It\'s time to take up space and own your worth.\n\nConfidence comes from action. Do the thing that scares you, even if your voice shakes. Every small step builds the muscle of self-trust.',
      reflectionPrompts: [
        'Where in your life do you play small?',
        'List three things you are genuinely good at.',
        'What would you do if you knew you couldn\'t fail?'
      ],
      iconName: 'star',
    ),
    const PatternTemplate(
      id: 'growth_embracing_change',
      category: 'growth',
      title: 'Embracing Change',
      shortDescription: 'Learning flexibility in the face of the unknown.',
      longDescription:
          'Change is the only constant, and you are being asked to flow with it. You may feel like the ground is shifting beneath your feet. Resistance only creates suffering. The more you can surrender to the current, the faster it will take you where you need to go.\n\nTrust that what is leaving is making space for something better. You are being upgraded.',
      reflectionPrompts: [
        'What are you holding onto that is ready to go?',
        'How do you typically react to unexpected changes?',
        'What excites you about the future?'
      ],
      iconName: 'change_circle',
    ),
    const PatternTemplate(
      id: 'growth_finding_balance',
      category: 'growth',
      title: 'Finding Balance',
      shortDescription: 'Managing extremes to find your center.',
      longDescription:
          'You may tend to swing between extremes—all or nothing, feast or famine. Your current growth edge is finding the "middle way." Balance isn\'t a static state; it\'s a constant adjustment, like riding a bike.\n\nLook at where you are overextending. Where can you pull back? Where do you need to give more? Harmony is your goal.',
      reflectionPrompts: [
        'In what area of life are you most "out of balance"?',
        'What does a perfectly balanced day look like to you?',
        'How can you say "no" to create more space?'
      ],
      iconName: 'balance',
    ),
    const PatternTemplate(
      id: 'growth_authentic_voice',
      category: 'growth',
      title: 'Authentic Voice',
      shortDescription: 'Learning to speak your truth without fear.',
      longDescription:
          'Your voice is powerful, but you may have silenced it to keep the peace. No more. The world needs your unique perspective. It\'s time to speak up, set boundaries, and share your story.\n\nAuthenticity is magnetic. When you speak your truth, you attract the people and opportunities that are truly meant for you.',
      reflectionPrompts: [
        'When do you find yourself biting your tongue?',
        'What is a truth you are afraid to speak?',
        'How does it feel when you express yourself honestly?'
      ],
      iconName: 'mic',
    ),

    // -------------------------------------------------------------------------
    // RELATIONSHIPS
    // -------------------------------------------------------------------------
    const PatternTemplate(
      id: 'rel_deep_connection',
      category: 'relationships',
      title: 'Deep Connection Seeker',
      shortDescription: 'You crave intimacy and deep understanding.',
      longDescription:
          'Small talk bores you. You want to know someone\'s soul. You thrive in relationships where nothing is off-limits and vulnerability is the norm. You search for a partner who can meet you in the depths.\n\nRemember that not everyone can swim as deep as you. Patience effectively screens for those who are willing to dive.',
      reflectionPrompts: [
        'What does intimacy mean to you?',
        'Do you feel safe showing your vulnerabilities?',
        'What is a "dealbreaker" for you in relationships?'
      ],
      iconName: 'diversity_1',
    ),
    const PatternTemplate(
      id: 'rel_space_protector',
      category: 'relationships',
      title: 'Space Protector',
      shortDescription:
          'You need alone time to recharge from social interaction.',
      longDescription:
          'You love people, but you need your cave. Solitude is where you reassemble yourself. In relationships, you need a partner who understands that your need for space isn\'t a rejection of them.\n\nCommunicating this need clearly is key. "I need an hour to recharge so I can be present with you" is a loving boundary.',
      reflectionPrompts: [
        'How much alone time do you get per week?',
        'How do you communicate your need for space?',
        'Do you feel guilty for taking time for yourself?'
      ],
      iconName: 'shield',
    ),
    const PatternTemplate(
      id: 'rel_direct_communicator',
      category: 'relationships',
      title: 'Direct Communicator',
      shortDescription: 'You value honesty and clarity over tact.',
      longDescription:
          'You don\'t play games. You say what you mean and mean what you say. While this clarity is refreshing, it can sometimes be perceived as harsh. You value truth above all else in your connections.\n\nYour lesson is to deliver truth with kindness. Honesty without compassion can be brutality.',
      reflectionPrompts: [
        'Has your honesty ever gotten you into trouble?',
        'How do you handle conflict in relationships?',
        'Can you be honest without being hurtful?'
      ],
      iconName: 'chat_bubble',
    ),
    const PatternTemplate(
      id: 'rel_conflict_avoider',
      category: 'relationships',
      title: 'Conflict Avoider',
      shortDescription: 'You struggle with confrontation and disharmony.',
      longDescription:
          'You want everyone to get along. Conflict makes you physically uncomfortable, so you often smooth things over or suppress your own needs to keep the peace. This creates a false harmony that can build resentment.\n\nConflict is not inherently bad; it\'s a pathway to deeper understanding. Learning to stay present in discomfort is your growth edge.',
      reflectionPrompts: [
        'What are you afraid will happen if you disagree?',
        'When was the last time you avoided a difficult conversation?',
        'How can you practice healthy conflict?'
      ],
      iconName: 'handshake',
    ),
    const PatternTemplate(
      id: 'rel_loyal_companion',
      category: 'relationships',
      title: 'Loyal Companion',
      shortDescription: 'You are deeply committed and protective.',
      longDescription:
          'Once you choose someone, you are in for the long haul. You are the rock, the ride-or-die. Your loyalty is fierce. You prioritize the "we" over the "me" and are willing to sacrifice for your loved ones.\n\nEnsure that your loyalty is reciprocated. Don\'t set yourself on fire to keep others warm.',
      reflectionPrompts: [
        'Who has earned your loyalty?',
        'Do you maintain your own identity in relationships?',
        'What boundaries do you need to set with loved ones?'
      ],
      iconName: 'group',
    ),
  ];
}
