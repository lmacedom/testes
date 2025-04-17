import Link from "next/link";
import { Button } from "@/components/ui/button";

export default function Home() {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-4 text-center">
      <div className="max-w-3xl mx-auto">
        <h1 className="text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl md:text-6xl">
          <span className="block">Plataforma para</span>
          <span className="block text-orange-600">Marceneiros</span>
        </h1>
        
        <p className="mt-3 text-base text-gray-500 sm:mt-5 sm:text-lg md:mt-5 md:text-xl">
          Conectando marceneiros a clientes com orçamentos instantâneos.
          Gerencie seus orçamentos, comunique-se com clientes e expanda seu negócio.
        </p>
        
        <div className="mt-8 flex flex-col sm:flex-row justify-center gap-4">
          <Button asChild className="bg-orange-600 hover:bg-orange-700">
            <Link href="/login">Entrar na Plataforma</Link>
          </Button>
          
          <Button asChild variant="outline" className="border-orange-600 text-orange-600 hover:bg-orange-50">
            <Link href="/cadastro">Cadastrar Marcenaria</Link>
          </Button>
        </div>
        
        <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="p-6 bg-white rounded-lg shadow-md">
            <h3 className="text-lg font-medium text-gray-900">Orçamentos Instantâneos</h3>
            <p className="mt-2 text-gray-500">
              Receba demandas de clientes que já passaram pelo processo de orçamento instantâneo.
            </p>
          </div>
          
          <div className="p-6 bg-white rounded-lg shadow-md">
            <h3 className="text-lg font-medium text-gray-900">Gerenciamento Simplificado</h3>
            <p className="mt-2 text-gray-500">
              Acompanhe e refine orçamentos em uma interface intuitiva e organizada.
            </p>
          </div>
          
          <div className="p-6 bg-white rounded-lg shadow-md">
            <h3 className="text-lg font-medium text-gray-900">Comunicação Direta</h3>
            <p className="mt-2 text-gray-500">
              Converse diretamente com os clientes para esclarecer detalhes e fechar negócios.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
