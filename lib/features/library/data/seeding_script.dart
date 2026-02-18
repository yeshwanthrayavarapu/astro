import 'package:life_pattern/features/library/domain/content_collection.dart';
import 'package:life_pattern/features/library/domain/content_item.dart';

// -----------------------------------------------------------------------------
// Seeding Data
// -----------------------------------------------------------------------------

final List<ContentCollection> seedCollections = [
  // Collection 1: Patterns
  ContentCollection(
    id: 'col_patterns',
    title: 'Understanding Your Patterns',
    description:
        'Discover the core personality blueprints that shape who you are.',
    imageUrl: 'assets/images/library/patterns.png', // Placeholder
    category: 'patterns',
    isPremium: false,
    sortOrder: 1,
    createdAt: DateTime.now(),
  ),
  // Collection 2: Timing
  ContentCollection(
    id: 'col_timing',
    title: "Navigating Life's Timing",
    description:
        'Learn to read the cosmic clock and flow with your natural cycles.',
    imageUrl: 'assets/images/library/timing.png', // Placeholder
    category: 'timing',
    isPremium: false,
    sortOrder: 2,
    createdAt: DateTime.now(),
  ),
  // Collection 3: Relationships
  ContentCollection(
    id: 'col_relationships',
    title: 'Relationship Dynamics',
    description:
        'Deepen your connections by understanding compatibility and conflict.',
    imageUrl: 'assets/images/library/relationships.png', // Placeholder
    category: 'relationships',
    isPremium: false,
    sortOrder: 3,
    createdAt: DateTime.now(),
  ),
  // Collection 4: Growth
  ContentCollection(
    id: 'col_growth',
    title: 'Personal Growth Tools',
    description:
        'Practical exercises and journaling for self-discovery and integration.',
    imageUrl: 'assets/images/library/growth.png', // Placeholder
    category: 'growth',
    isPremium: false,
    sortOrder: 4,
    createdAt: DateTime.now(),
  ),
];

final List<ContentItem> seedItems = [
  // ---------------------------------------------------------------------------
  // Collection 1: Patterns
  // ---------------------------------------------------------------------------
  ContentItem(
    id: 'item_patterns_1',
    collectionId: 'col_patterns',
    title: 'What Are Personality Patterns?',
    subtitle: 'An introduction to the building blocks of your psyche.',
    contentMarkdown: '''
# What Are Personality Patterns?

Personality patterns are the recurring themes, behaviors, and motivations that define how we interact with the world. Think of them as the "psychological DNA" that shapes your unique character.

## The Core Concept

At their heart, patterns are neither "good" nor "bad." They are simply energy. How you express that energy determines whether a pattern manifests as a strength or a challenge.

For example, a "Warrior" pattern encapsulates energy related to action, defense, and drive.
- **In balance:** It shows up as courage, decisiveness, and protection.
- **Out of balance:** It can manifest as aggression, impatience, or conflict.

## Recognizing Your Patterns

The first step in self-awareness is recognition. You might notice patterns in:
1. **Relationships:** Do you always attract the same type of person?
2. **Career:** Do you face similar challenges in every job?
3. **Emotions:** do you have a default emotional reaction to stress?

By identifying these recurring themes, you move from being unconsciously driven by them to consciously working *with* them.
''',
    readTimeMinutes: 5,
    isPremium: false,
    sortOrder: 1,
    tags: ['intro', 'psychology', 'patterns'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),
  ContentItem(
    id: 'item_patterns_2',
    collectionId: 'col_patterns',
    title: 'How Your Birth Chart Shapes You',
    subtitle: 'Connecting the cosmic map to your earthly experience.',
    contentMarkdown: '''
# The Cosmic Map

Your birth chart is a snapshot of the sky at the exact moment and place you were born. It serves as a blueprint for your potential—a map of the energies you chose to embody in this lifetime.

## The Big Three

While your chart is complex, three key components tell a significant part of the story:

### 1. The Sun (Identity)
Your Sun sign represents your core essence, your ego, and your vitality. It is the "hero" of your story.

### 2. The Moon (Emotion)
Your Moon sign governs your emotional landscape, your instincts, and what you need to feel safe and nurtured.

### 3. The Ascendant (Appearance)
Also known as the Rising sign, this is the mask you wear for the world. It dictates your first impressions and how you initiate action.

## Integrating the Map

Understanding your chart isn't about fatalism; it's about empowerment. When you know your map, you can navigate your terrain with greater skill and purpose.
''',
    readTimeMinutes: 7,
    isPremium: false,
    sortOrder: 2,
    tags: ['astrology', 'birth chart', 'basics'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),
  ContentItem(
    id: 'item_patterns_3',
    collectionId: 'col_patterns',
    title: 'Deep Dive: Core Self Patterns',
    subtitle: 'Unlocking the power of your primary energetic signature.',
    contentMarkdown: '''
# Deep Dive: Core Self Patterns

Your Core Self patterns represent the fundamental way you assert your existence. These are the energies associated with your Sun and Mars—your drive, your will, and your vitality.

## The Mechanics of Will

Everything starts with the will to be. When your Core Self patterns are healthy, you feel a natural sense of agency. You know what you want, and you have the energy to pursue it.

### Signs of Blocked Core Energy
- **Lethargy:** Feeling like you can't get started.
- **People-pleasing:** Sacrificing your own needs to avoid conflict.
- **Resentment:** Anger that turns inward when not expressed.

## Activation Exercises

To strengthen your Core Self:
1. **Physical Movement:** Strong, rhythmic exercise (running, boxing, dancing) helps clear stagnant Mars energy.
2. **"I Am" Statements:** Practice affirming your identity. "I am strong," "I am capable."
3. **Boundaries:** Practice saying "no" to small things to build the muscle of self-assertion.

*This premium content goes deeper into specific Sun-Mars combinations in the next section...*
''',
    readTimeMinutes: 10,
    isPremium: true,
    sortOrder: 3,
    tags: ['premium', 'core self', 'mars'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),
  ContentItem(
    id: 'item_patterns_4',
    collectionId: 'col_patterns',
    title: 'Healing Shadow Patterns',
    subtitle: 'Integrating the parts of yourself you’ve rejected.',
    contentMarkdown: '''
# The Shadow Self

The "Shadow" refers to the parts of our personality that we have repressed, denied, or disowned. Often, these are traits we were told were "bad" in childhood.

## Why We Have a Shadow

If you were praised for being quiet, you might have repressed your loud, expressive side. If you were praised for being strong, you might have repressed your vulnerability. These repressed parts don't disappear; they go into the shadow.

## Shadow Work

Shadow work is the process of reclaiming these lost parts. It is essential for wholeness because the shadow often contains:
- **Creativity:** Unfiltered expression matches shadow energy.
- **Power:** True authority requires owning your capacity for aggression/assertiveness.
- **Passion:** Deep desire is often shadow-bound.

### Techniques for Integration
1. **Notice Triggers:** What irritates you in others is often a reflection of your own shadow.
2. **Dialogue:** Journal a conversation with the part of you that you judge. Ask it what it needs.

*Premium members: Access the guided Shadow Meditation below.*
''',
    readTimeMinutes: 12,
    isPremium: true,
    sortOrder: 4,
    tags: ['premium', 'shadow work', 'healing'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),

  // ---------------------------------------------------------------------------
  // Collection 2: Timing
  // ---------------------------------------------------------------------------
  ContentItem(
    id: 'item_timing_1',
    collectionId: 'col_timing',
    title: 'Introduction to Life Cycles',
    subtitle: 'Why time is not linear, but cyclical.',
    contentMarkdown: '''
# Time is a Spiral

In our modern world, we view time as a straight line—past to future. But nature (and astrology) views time as a spiral. Seasons return, but every spring is different.

## The Planetary Cycles

Just as the Moon cycles every 28 days, affecting the tides and our moods, other planets have longer cycles that shape chapters of our lives.

- **Saturn Return (Age ~29):** The threshold of adulthood. A time of structuring and responsibility.
- **Uranus Opposition (Age ~42):** The "mid-life crisis." A time of liberation and radical change.
- **Jupiter Return (Every ~12 years):** Years of growth, expansion, and new opportunities.

Understanding these cycles helps you surrender to the current weather of your life instead of fighting it.
''',
    readTimeMinutes: 6,
    isPremium: false,
    sortOrder: 1,
    tags: ['timing', 'cycles', 'intro'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),
  ContentItem(
    id: 'item_timing_2',
    collectionId: 'col_timing',
    title: 'Major Transitions',
    subtitle: 'Navigating the stormy seas of big life changes.',
    contentMarkdown: '''
# Navigating the Storm

Major planetary transits—like Pluto crossing your Sun or Saturn hitting your Moon—mark periods of intense transition. These times can feel destabilizing, but they are purposeful.

## The Breakdown Before the Breakthrough

Often, old structures must crumble before new ones can be built. This is the archetype of the Tower tarot card or the Phoenix rising.

### Coping Strategies
1. **Grounding:** When everything is changing, find one routine to anchor you.
2. **Rest:** Transformation consumes immense energy. Sleep more.
3. **Trust:** Remind yourself that you are being prepared for a new level of existence.

*Detailed breakdown of specific transit types available below...*
''',
    readTimeMinutes: 9,
    isPremium: true,
    sortOrder: 2,
    tags: ['premium', 'transitions', 'saturn'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),

  // ---------------------------------------------------------------------------
  // Collection 3: Relationships
  // ---------------------------------------------------------------------------
  ContentItem(
    id: 'item_rel_1',
    collectionId: 'col_relationships',
    title: 'Compatibility Beyond Sun Signs',
    subtitle: 'Why you are more than just your horoscope sign.',
    contentMarkdown: '''
# Beyond the Sun

"I'm a Leo and he's a Scorpio—are we doomed?" 

Popular astrology focuses heavily on Sun signs, but relationship compatibility (Synastry) is a symphony of many instruments.

## Key Players in Love

1. **The Moon:** Emotional safety. Do you comfort each other in compatible ways?
2. **Mercury:** Communication. Do you understand how the other thinks?
3. **Venus:** Values and Affection. How do you show love?
4. **Mars:** Drive and Desire. How do you handle conflict and sex?

A "bad" Sun sign match can be saved by a beautiful Moon connection. Conversely, a "perfect" Sun match can suffer if Mercuries clash constantly.
''',
    readTimeMinutes: 6,
    isPremium: false,
    sortOrder: 1,
    tags: ['relationships', 'compatibility', 'synastry'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),
  ContentItem(
    id: 'item_rel_2',
    collectionId: 'col_relationships',
    title: 'Navigating Conflict Styles',
    subtitle: 'Using Mars placement to understand how you fight.',
    contentMarkdown: '''
# The Mars Factor

Mars governs how we assert ourselves and how we handle anger. In relationships, clashing Mars styles is the #1 cause of destructive conflict.

## The Styles

- **Mars in Fire (Aries, Leo, Sag):** Explosive but quick to forgive. Needs to "let it out."
- **Mars in Water (Cancer, Scorpio, Pisces):** Emotional and indirect. Needs safety to express anger.
- **Mars in Air (Gemini, Libra, Aquarius):** Verbal and detachment. Wants to "discuss" the fight.
- **Mars in Earth (Taurus, Virgo, Cap):** Slow and practical. Resists being rushed.

## Bridging the Gap

If you are Fire and your partner is Water, you might overwhelm them. You need to verify they feel safe. If they are shut down, you need to back off.

*Premium: Take the Conflict Style Quiz...*
''',
    readTimeMinutes: 8,
    isPremium: true,
    sortOrder: 2,
    tags: ['premium', 'relationships', 'conflict'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),
  // ---------------------------------------------------------------------------
  // Collection 4: Growth
  // ---------------------------------------------------------------------------
  ContentItem(
    id: 'item_growth_1',
    collectionId: 'col_growth',
    title: 'Journaling for Self-Discovery',
    subtitle: 'Simple prompts to unlock your inner wisdom.',
    contentMarkdown: '''
# The Power of the Page

Writing is a form of magic. It takes the chaos of the mind and gives it structure on the page.

## Getting Started

 Don't worry about grammar or spelling. This is for you alone.

### Prompt 1: The Morning Check-in
* "How do I feel right now?"
* "What is one thing I need today?"

### Prompt 2: The Pattern Spotter
* "When did I feel triggered today? What happened just before that?"
* "What does this remind me of from my past?"

### Prompt 3: The Future Self
* "If I was the most evolved version of myself, how would I handle this situation?"
''',
    readTimeMinutes: 5,
    isPremium: false,
    sortOrder: 1,
    tags: ['growth', 'journaling', 'tools'],
    imageUrl: null,
    publishedAt: DateTime.now(),
  ),
];
