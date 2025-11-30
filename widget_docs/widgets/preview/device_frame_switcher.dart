import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

enum PreviewDevice { ios, android, web }

class DeviceFrameSwitcher extends StatefulWidget {
  const DeviceFrameSwitcher({
    super.key,
    required this.child,
    this.initialDevice = PreviewDevice.ios,
  });

  final Widget child;
  final PreviewDevice initialDevice;

  @override
  State<DeviceFrameSwitcher> createState() => _DeviceFrameSwitcherState();
}

class _DeviceFrameSwitcherState extends State<DeviceFrameSwitcher> {
  late PreviewDevice _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialDevice;
  }

  dynamic _currentDevice() {
    switch (_selected) {
      case PreviewDevice.ios:
        return Devices.ios.iPhone16ProMax;
      case PreviewDevice.android:
        return Devices.android.samsungGalaxyS20;
      case PreviewDevice.web:
        return Devices.macOS.macBookPro;
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = _currentDevice();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildToggleButton('iOS', PreviewDevice.ios),
              const SizedBox(width: 8),
              _buildToggleButton('Android', PreviewDevice.android),
              // const SizedBox(width: 8),
              // _buildToggleButton('Web/Window', PreviewDevice.web),
            ],
          ),
        ),

        SizedBox(
          width: 240,
          height: 540,
          child: DeviceFrame(
            device: device,
            screen: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                // Use LayoutBuilder to know the available screen area inside the
                // device frame. We try to keep a stable target size for the
                // preview content (so it doesn't get cut off when switching
                // devices) and only shrink it when the device's screen is too
                // small.
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const targetWidth = 220.0;
                    const targetHeight = 480.0;

                    final width =
                        targetWidth <= constraints.maxWidth
                            ? targetWidth
                            : constraints.maxWidth;
                    final height =
                        targetHeight <= constraints.maxHeight
                            ? targetHeight
                            : constraints.maxHeight;

                    return SizedBox(
                      width: width,
                      height: height,
                      child: Center(child: widget.child),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleButton(String label, PreviewDevice deviceType) {
    final selected = _selected == deviceType;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: selected ? 4 : 0,
        backgroundColor:
            selected ? Theme.of(context).colorScheme.primary : Colors.grey[300],
        foregroundColor: selected ? Colors.white : Colors.black87,
      ),
      onPressed: () => setState(() => _selected = deviceType),
      child: Text(label),
    );
  }
}
