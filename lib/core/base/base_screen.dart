import 'package:dome/core/base/base_vm.dart';
import 'package:dome/res/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({super.key, required this.vmBuilder, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: vmBuilder(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(BuildContext context, T viewModel, Widget? child) {
    final ThemeData theme = Theme.of(context);
    final BPallete? palette = theme.extension<BPallete>();

    if (!viewModel.isInitialized && viewModel.isLoading == true) {
      return Container(
          color: palette!.backgroundColor,
          child: const Center(child: Loader()));
    } else {
      return Stack(
        children: [
          builder(context, viewModel),
          Visibility(
            visible: viewModel.isLoading,
            child: const Center(child: Loader()),
          )
        ],
      );
    }
  }
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.height = 45,
    this.width = 45,
  });
  final int height;
  final int width;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final BPallete? palette = theme.extension<BPallete>();
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: palette!.backgroundColor!.withOpacity(0.4),
        ),
        CircularProgressIndicator(
          color: palette.primaryColor,
        )
      ],
    );
  }
}
