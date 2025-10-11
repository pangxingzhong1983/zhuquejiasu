import 'dart:io';

import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:zhuquejiasu/plugins/app.dart';
import 'package:zhuquejiasu/providers/config.dart';
import 'package:zhuquejiasu/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FindProcessBuilder extends StatelessWidget {
  final Widget Function(bool value) builder;

  const FindProcessBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final value = ref.watch(
          patchClashConfigProvider.select(
            (state) =>
                state.findProcessMode == FindProcessMode.always &&
                Platform.isAndroid,
          ),
        );
        return builder(value);
      },
    );
  }
}

class ConnectionItem extends StatelessWidget {
  final Connection connection;
  final Function(String)? onClick;
  final Widget? trailing;

  const ConnectionItem({
    super.key,
    required this.connection,
    this.onClick,
    this.trailing,
  });

  Future<ImageProvider?> _getPackageIcon(Connection connection) async {
    return await app?.getPackageIcon(connection.metadata.process);
  }

  String _getSourceText(Connection connection) {
    final metadata = connection.metadata;
    if (metadata.process.isEmpty) {
      return connection.start.lastUpdateTimeDesc;
    }
    return "${metadata.process} · ${connection.start.lastUpdateTimeDesc}";
  }

  @override
  Widget build(BuildContext context) {
    final title = Text(
      connection.desc,
      style: context.textTheme.bodyLarge,
    );
    final subTitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          _getSourceText(connection),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          runSpacing: 6,
          spacing: 6,
          children: [
            for (final chain in connection.chains)
              CommonChip(
                label: chain,
                onPressed: () {
                  if (onClick == null) return;
                  onClick!(chain);
                },
              ),
          ],
        ),
      ],
    );
    if (!Platform.isAndroid) {
      return ListItem(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        tileTitleAlignment: ListTileTitleAlignment.titleHeight,
        title: title,
        subtitle: subTitle,
        trailing: trailing,
      );
    }
    return FindProcessBuilder(
      builder: (bool value) {
        final leading = value
            ? GestureDetector(
                onTap: () {
                  if (onClick == null) return;
                  final process = connection.metadata.process;
                  if (process.isEmpty) return;
                  onClick!(process);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 48,
                  height: 48,
                  child: FutureBuilder<ImageProvider?>(
                    future: _getPackageIcon(connection),
                    builder: (_, snapshot) {
                      if (!snapshot.hasData && snapshot.data == null) {
                        return Container();
                      } else {
                        return Image(
                          image: snapshot.data!,
                          gaplessPlayback: true,
                          width: 48,
                          height: 48,
                        );
                      }
                    },
                  ),
                ),
              )
            : null;
        return ListItem(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          tileTitleAlignment: ListTileTitleAlignment.titleHeight,
          leading: leading,
          title: title,
          subtitle: subTitle,
          trailing: trailing,
        );
      },
    );
  }
}
