import 'package:flutter/material.dart';
import 'package:github/presentation/widgets/project_tile_item.dart';
import 'package:github/theme/theme.dart';
import 'package:github/viewmodels/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Projects"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: const Color(0xfff1fcf6),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: model.usernameController,
                    onChanged: model.onDebounce,
                    validator: (value) => value == null || value.isEmpty
                        ? "Enter your username"
                        : null,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "johndoe",
                      labelText: "Username",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.accent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: model.isBusy ? null : model.previousPage,
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: model.isBusy ? null : model.nextPage,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  model.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      // check if there was an error in the service
                      : model.hasError
                          ? const Center(
                              child: Text(
                                "This user does not exist",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          // handle empty projects list
                          : model.repositoryList.isEmpty
                              ? const Center(
                                  child: Text(
                                    "No repositories. Search for user",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: ListView.separated(
                                    itemCount: model.repositoryList.length,
                                    itemBuilder: (context, index) {
                                      return RepositoryCard(
                                          key: ValueKey(
                                              model.repositoryList[index].id),
                                          githubRepo:
                                              model.repositoryList[index]);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                  ),
                                )
                ],
              ),
            ),
          );
        });
  }
}
