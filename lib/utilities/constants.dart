// --- API Data ---
const baseAllTowersUrl = 'https://statsnite.com/api/btd/v3/towers';
const baseAllHeroesUrl = 'https://statsnite.com/api/btd/v3/heroes';
const baseAllBloonsUrl = 'https://statsnite.com/api/btd/v3/bloons';

const baseTowerUrl = 'https://statsnite.com/api/btd/v3/tower';
const baseHeroUrl = 'https://statsnite.com/api/btd/v3/hero';
const baseBloonUrl = 'https://statsnite.com/api/btd/v3/bloon';

// --- API Images ---
const baseTowerImageUrl = 'https://statsnite.com/images/btd/towers';
const baseHeroImageUrl = 'https://statsnite.com/images/btd/heroes';
const baseBloonImageUrl = 'https://statsnite.com/images/btd/bloons';

// --- Towers ID ---
// -- Primary --
const String dartMonkey = 'dart-monkey';
const String boomerangMonkey = 'boomerang-monkey';
const String bombShooter = 'bomb-shooter';
const String tackShooter = 'tack-shooter';
const String iceMonkey = 'ice-monkey';
const String glueGunner = 'glue-gunner';
// -- Military --
const String sniperMonkey = 'sniper-monkey';
const String monkeySub = 'monkey-sub';
const String monkeyBuccaneer = 'monkey-buccaneer';
const String monkeyAce = 'monkey-ace';
const String heliPilot = 'heli-pilot';
const String mortarMonkey = 'mortar-monkey';
const String dartlingGunner = 'dartling-gunner';
// -- Magic --
const String wizardMonkey = 'wizard-monkey';
const String superMonkey = 'super-monkey';
const String ninjaMonkey = 'ninja-monkey';
const String alchemist = 'alchemist';
const String druid = 'druid';
// -- Support --
const String bananaFarm = 'banana-farm';
const String spikeFactory = 'spike-factory';
const String monkeyVillage = 'monkey-village';
const String engineerMonkey = 'engineer-monkey';

// --- Heroes ID ---
const String quincy = 'quincy';
const String gwendolin = 'gwendolin';
const String strikerJones = 'striker-jones';
const String obynGreenfoot = 'obyn-greenfoot';
const String captainChurchill = 'captain-churchill';
const String benjamin = 'benjamin';
const String ezili = 'ezili';
const String patFusty = 'pat-fusty';
const String adora = 'adora';
const String admiralBrickell = 'admiral-brickell';
const String etienne = 'etienne';
const String sauda = 'sauda';
const String psi = 'psi';
const String geraldo = 'geraldo';

// --- Categories ---
const List<String> categories = ['Towers', 'Heroes', 'Bloons'];
const List<String> classes = ['All', 'Primary', 'Military', 'Magic', 'Support'];
const List<String> bloonPropertiesForExpansion = [
  'variants',
  'children',
  'parents',
];

enum StatesType {
  initial,
  loading,
  loaded,
  error,
}
