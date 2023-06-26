import QtQuick
import QtQuick.Window
import QtQuick3D

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    View3D {
        id: view3D
        anchors.fill: parent
        environment: sceneEnvironment       // 渲染的环境相关设置
        SceneEnvironment {
            id: sceneEnvironment
            antialiasingQuality: SceneEnvironment.High  // 抗锯齿质量
            antialiasingMode: SceneEnvironment.MSAA
        }

        Node {  // 3D的节点，类似于quick中的Item。便于对多个控件的统一控制
            id: node
            DirectionalLight {      // 光源
                id: directionalLight
            }

            PerspectiveCamera {     // 远景相机（显示的3D模型根据相机的远近进行缩放）
                id: camera
                z: 15
            }

            Model {         // 模型，用于显示加载3D模型
                id: cubeModel
                source: "test.mesh"
                DefaultMaterial {   // 模型材质设置
                    id: cubeMaterial
                    diffuseColor: "#4aee45"
                }
                materials: cubeMaterial
            }
        }
    }
}
