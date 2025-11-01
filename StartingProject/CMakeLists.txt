cmake_minimum_required(VERSION 3.16)

project(IntroToQtQuickControls_StartingProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appIntroToQtQuickControls
    main.cpp
)

qt_add_qml_module(appIntroToQtQuickControls
    URI IntroToQtQuickControls
    VERSION 1.0
    QML_FILES
        Main.qml
        MenuPage.qml
        DishItem.qml

    RESOURCES
        fonts/SpicyPotatos.ttf
        image/vietnamese_food.jpg
        image/light/cart_add.svg
        image/light/cart_remove.svg
        image/light/checkout.svg
        image/light/mild.svg
        image/light/very_hot.svg
        image/dark/cart_add.svg
        image/dark/cart_remove.svg
        image/dark/checkout.svg
        image/dark/mild.svg
        image/dark/very_hot.svg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appIntroToQtQuickControls PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appIntroToQtQuickControls
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appIntroToQtQuickControls
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appIntroToQtQuickControls
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
