import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});
  final MapController _mapController = MapController();
  final LatLng position = LatLng(27.6709, 85.3197);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double currentZoom = 18.0;
  final double minZoom = 1.0;
  final double maxZoom = 22.0;
  final double zoomStep = 1.0;

  void _zoomIn() {
    if (currentZoom < maxZoom) {
      setState(() {
        currentZoom += zoomStep;
      });
      widget._mapController.move(
        widget._mapController.camera.center,
        currentZoom,
      );
    }
  }

  void _zoomOut() {
    if (currentZoom > minZoom) {
      setState(() {
        currentZoom -= zoomStep;
      });
      widget._mapController.move(
        widget._mapController.camera.center,
        currentZoom,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: widget._mapController,
          options: MapOptions(
            initialZoom: currentZoom,
            initialCenter: widget.position,
            minZoom: minZoom,
            maxZoom: maxZoom,
            interactionOptions: const InteractionOptions(
              flags:
                  InteractiveFlag.pinchZoom |
                  InteractiveFlag.doubleTapZoom |
                  InteractiveFlag.drag |
                  InteractiveFlag.rotate,
            ),
            onMapEvent: (MapEvent mapEvent) {
              if (mapEvent is MapEventMove) {
                setState(() {
                  currentZoom = mapEvent.camera.zoom;
                });
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              tileProvider: CancellableNetworkTileProvider(),
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 24.0,
                  height: 24.0,
                  point: widget.position,
                  child: Image.asset(
                    'assets/images/pin.png',
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Column(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(onPressed: _zoomIn, icon: Icon(Icons.add)),
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: _zoomOut,
                    icon: Icon(Icons.remove),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
