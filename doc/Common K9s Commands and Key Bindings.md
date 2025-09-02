# Common K9s Commands and Key Bindings

## Navigation
- ```:resource``` + ```Enter```: View a specific Kubernetes resource (e.g., :pod, :svc, :deploy, :ns). Accepts singular, plural, short-name, or alias.
- ```Esc```: Go back to the previous view or navigate up in the resource hierarchy.
- ```Arrow keys (Up/Down)```: Navigate through lists of resources.
- ```Enter```: Zoom into the highlighted resource for more details.
- ```Ctrl-a``` or ```Command-a```: View all available resources, including custom resources.

## Filtering and Searching
- ```/filter``` + ```Enter```: Filter the current view using a regex pattern.
- ```:resource /filter``` + ```Enter```: View a specific resource type filtered by a pattern (e.g., :pod /my-app).
- ```:resource label=value``` + ```Enter```: View resources with specific labels (e.g., :pod app=nginx).

## Actions
- ```:quit``` or ```:q``` or ```Ctrl-c```: Exit K9s.
- ```Ctrl-d```: Delete the selected resource (requires confirmation).
- ```Ctrl-k```: Kill the selected resource (no confirmation).
- ```Shift-F```: Enable port forwarding for a selected pod.
- ```F``` then ```D```: Delete active port forwarding.
- ```Ctrl-l```: Start benchmarking a service or container (requires port-forwarding enabled).

## Context and Namespace Management
- ```:namespace``` or ```:ns```: List all namespaces.
- ```:resource ns-x``` + ```Enter```: View a resource in a specific namespace.
- ```:resource @context-name``` + ```Enter```: View resources in a specific Kubernetes context.

## Information and Help
- ```?```: Open the help menu to view key bindings and commands.
- ```k9s info```: Display K9s configuration and cluster information from the command line.

## Run K9s With Specific Options
- ```k9s -n mynamespace```: Launch K9s in a specific namespace.
- ```k9s -c pod```: Launch K9s directly into the pod view.
- ```k9s --context mycontext```: Start K9s using a non-default Kubernetes context.
- ```k9s --readonly```: Start K9s in read-only mode, disabling modification commands.
