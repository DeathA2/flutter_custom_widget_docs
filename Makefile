# ===========
# FLUTTER MAKEFILE
# ===========

# 🧩 Default project variables
FLUTTER := flutter

clean:
	$(FLUTTER) clean

get:
	$(FLUTTER) pub get

analyze:
	$(FLUTTER) analyze

test:
	$(FLUTTER) test --coverage


web:
	$(FLUTTER) build web --release -t widget_docs/doc_widget_main.dart

runWeb:
	$(FLUTTER) run -t widget_docs/doc_widget_main.dart


deployWeb: 
	web
	firebase deploy --only hosting

genLanguage:
	$(FLUTTER) gen-l10n

runner:
	dart run build_runner build --delete-conflicting-outputs