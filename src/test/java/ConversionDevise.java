import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ConversionDevise {
   private Montant notreMontant;

   @When("Je convertis {double} {string} en {string}")
   public void jeConvertisEn(Double montant, String deviseSource, String deviseCible) {
      notreMontant = Montant.convertir(montant, deviseCible);
   }

   @Then("Je dois avoir {double} {string}")
   public void jeDoisAvoir(Double montant, String deviseCible) {
      assertEquals(new Montant(montant, deviseCible), this.notreMontant);
   }

   @Then("Je ne peux pas convertir")
   public void jeNePeuxPasConvertir() {
      assertEquals(null, notreMontant);
   }

   @When("Je convertis {string} {string} en {string}")
   public void jeConvertisEn(String montant, String deviseSource, String deviseCible) {
      notreMontant = Montant.convertir(montant, deviseCible);
   }
}
