include .env

.PHONY: deploy coverage

deploy-sepolia:
	forge script script/DeployMyToken.s.sol --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify -vvvv --ffi

coverage: 
	forge coverage --ir-minimum  