import 'Wizard.dart';
import 'WizardStep.dart';
import '../models/SwStack.dart';
import '../models/SwArchetype.dart';
import '../models/SwDeck.dart';

WizardStep pickObjectiveStep(Wizard wizard, Map<String, dynamic> data) {
  return WizardStep(wizard, () {
    print('in step2');
    List<SwArchetype> archetypes = data['archetypes'];
    SwStack library = data['library'];
    SwDeck deck = data['deck'];

    List<SwArchetype> allPossibleArchetypes =
        archetypes.where((a) => a.side == wizard.side).toList();
    SwStack objectives = library.byType('Objective');
    SwStack startingLocations = new SwStack(
      allPossibleArchetypes.map((a) => a.startingCard).toSet().toList(),
      'Starting Locations',
    ).bySide(wizard.side).byType('Location');

    wizard.currentStack = objectives.concat(startingLocations);

    wizard.addCurrentStepListener(deck);
  }, () {
    wizard.nextStep();
  });
}
