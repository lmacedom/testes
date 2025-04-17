import { NextRequest, NextResponse } from "next/server";

export async function GET(request: NextRequest) {
  return NextResponse.json({
    status: "success",
    message: "API da plataforma de marceneiros está funcionando!",
    timestamp: new Date().toISOString(),
  });
}
