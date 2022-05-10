import 'package:chattr/views/screens/nearby/nearby_bloc.dart';
import 'package:flutter/material.dart';

var _bloc = NearbyBloc();

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/near_user.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  top: size.height * 0.01,
                  left: 29,
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1608155686393-8fdd966d784d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.30,
                  left: 33,
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.37,
                  left: size.width * 0.60,
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.51,
                  left: size.width * 0.40,
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.53,
                  left: size.width * 0.72,
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1527203561188-dae1bc1a417f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80",
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.70,
                  left: size.width * 0.12,
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.12,
                  left: size.width * 0.70,
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.81,
                  left: size.width * 0.77,
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1455274111113-575d080ce8cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
