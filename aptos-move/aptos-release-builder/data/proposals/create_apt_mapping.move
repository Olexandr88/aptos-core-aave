// Initialize AIP-63 coin to fungible asset mapping.
// Create the mapping between coin <> FA and also add APT pairing in the map.

script {
    use aptos_framework::aptos_governance;

    fun main(proposal_id: u64) {
        let framework_signer = aptos_governance::resolve_multi_step_proposal(
            proposal_id,
            @0x1,
            { { script_hash } },
        );
        aptos_framework::coin::create_coin_conversion_map(&framework_signer);
        aptos_framework::coin::create_pairing<aptos_framework::aptos_coin::AptosCoin>(&framework_signer);
    }
}
