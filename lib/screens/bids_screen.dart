import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Bids extends ConsumerStatefulWidget {
  const Bids({super.key});

  @override
  ConsumerState<Bids> createState() => _BidsState();
}

class _BidsState extends ConsumerState<Bids> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text("bids"))
    );// Replace with your actual widget content
  }
}