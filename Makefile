.PHONY: bootstrap

bootstrap:
	helm upgrade --install argocd charts/platform/argocd \
		--namespace argocd \
		--create-namespace \
		--wait \
		--timeout 10m \
		--set argo-cd.server.certificate.enabled=false \
		--set argo-cd.server.ingress.tls=false

	kubectl apply -f bootstrap/app-of-apps.yaml
