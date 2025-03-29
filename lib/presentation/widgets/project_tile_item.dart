import 'package:flutter/material.dart';
import 'package:github/models/repository.model.dart';
import 'package:github/theme/theme.dart';
import 'package:github/utils/utils.dart';

class RepositoryCard extends StatelessWidget {
  final GithubRepo githubRepo;

  const RepositoryCard({
    super.key,
    required this.githubRepo,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            getCachedNetworkImage(context: context, imageUrl: githubRepo.owner!.avatarUrl!),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capitalize(githubRepo.name!),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    " By ${githubRepo.owner!.login}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Text(
              githubRepo.visibility!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
