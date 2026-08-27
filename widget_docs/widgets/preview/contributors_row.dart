import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/network/model/github/github_user_model.dart';

/// Overlapping avatars of the repository contributors, followed by the count.
///
/// The overlap is laid out by hand rather than with a negative left margin:
/// `Container` asserts `margin.isNonNegative`, so the row that used to build
/// this with `EdgeInsets.only(left: -8)` crashed on the first frame after the
/// contributors finished loading.
class ContributorsRow extends StatelessWidget {
  const ContributorsRow({
    super.key,
    required this.contributors,
    required this.onTapContributor,
    this.maxAvatars = 6,
  });

  final List<GithubUserModel> contributors;
  final void Function(GithubUserModel user) onTapContributor;

  /// How many avatars to draw before collapsing the rest into a `+N` badge.
  final int maxAvatars;

  static const double avatarSize = 28;
  static const double avatarOverlap = 8;
  static const double _step = avatarSize - avatarOverlap;

  /// Width the avatar cluster occupies for [avatarCount] circles.
  static double clusterWidth(int avatarCount) =>
      avatarCount <= 0 ? 0 : _step * (avatarCount - 1) + avatarSize;

  @override
  Widget build(BuildContext context) {
    final int count = contributors.length;
    if (count == 0) return const SizedBox.shrink();

    final int displayCount = count > maxAvatars ? maxAvatars : count;
    final List<Widget> avatars = <Widget>[];

    for (int i = 0; i < displayCount; i++) {
      final GithubUserModel u = contributors[i];
      final String? avatarUrl = u.avatarUrl;
      avatars.add(
        Tooltip(
          message: u.login ?? '',
          child: GestureDetector(
            onTap: () => onTapContributor(u),
            child: CircleAvatar(
              radius: avatarSize / 2,
              backgroundImage: avatarUrl != null && avatarUrl.isNotEmpty
                  ? NetworkImage(avatarUrl)
                  : null,
              backgroundColor: Colors.grey[300],
            ),
          ),
        ),
      );
    }

    if (count > maxAvatars) {
      final String names = contributors
          .skip(maxAvatars)
          .map((GithubUserModel e) => e.login ?? '')
          .join(', ');
      avatars.add(
        Tooltip(
          message: names,
          child: CircleAvatar(
            radius: avatarSize / 2,
            backgroundColor: Colors.black54,
            child: Text(
              '+${count - maxAvatars}',
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Row(
      children: <Widget>[
        SizedBox(
          width: clusterWidth(avatars.length),
          height: avatarSize,
          // Painted in order, so each avatar overlaps the left edge of the one
          // before it.
          child: Stack(
            children: <Widget>[
              for (int i = 0; i < avatars.length; i++)
                Positioned(
                  left: i * _step,
                  width: avatarSize,
                  height: avatarSize,
                  child: avatars[i],
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$count contributors',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
