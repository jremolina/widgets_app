import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_control_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transport { carro, avion, barco, tren }

class _UiControlsViewState extends State<_UiControlsView> {
  bool switchValue = true;
  Transport selectedvalue = Transport.carro;
  bool wantsbreakfast = false;
  bool wantslunch = false;
  bool wantsdinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Developer Node'),
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = !switchValue;
            });
          },
        ),

        ExpansionTile(
          title: Text('Medio de Transporte'),
          subtitle: Text('$selectedvalue'),
          children: [
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('carro'),
              value: Transport.carro,
              groupValue: selectedvalue,
              onChanged:
                  (value) => setState(() {
                    selectedvalue = Transport.carro;
                  }),
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('avion'),
              value: Transport.avion,
              groupValue: selectedvalue,
              onChanged:
                  (value) => setState(() {
                    selectedvalue = Transport.avion;
                  }),
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('tren'),
              value: Transport.tren,
              groupValue: selectedvalue,
              onChanged:
                  (value) => setState(() {
                    selectedvalue = Transport.tren;
                  }),
            ),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: const Text('barco'),
              value: Transport.barco,
              groupValue: selectedvalue,
              onChanged:
                  (value) => setState(() {
                    selectedvalue = Transport.barco;
                  }),
            ),
          ],
        ),

        CheckboxListTile(
          title: Text('Quiere Desayunar'),
          value: wantsbreakfast,
          onChanged:
              (value) => setState(() {
                wantsbreakfast = !wantsbreakfast;
              }),
        ),
        CheckboxListTile(
          title: Text('Quiere Almuerzo'),
          value: wantslunch,
          onChanged:
              (value) => setState(() {
                wantslunch = !wantslunch;
              }),
        ),
        CheckboxListTile(
          title: Text('Quiere Cenar'),
          value: wantsdinner,
          onChanged:
              (value) => setState(() {
                wantsdinner = !wantsdinner;
              }),
        ),
      ],
    );
  }
}
