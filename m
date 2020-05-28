Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619831E525B
	for <lists+linux-clk@lfdr.de>; Thu, 28 May 2020 02:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgE1Ax0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 27 May 2020 20:53:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgE1Ax0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 May 2020 20:53:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C10BD207CB;
        Thu, 28 May 2020 00:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590627205;
        bh=0n4zQAT8mJvU4sF96GyUq5+N5ztEIqb5MLKUV70GmuY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N2uNTLiyUhGAD/1N9T3eKa76o5PnQegZpd+T8UfOwqR2cjaDIdBn4YX6AEBDrDdl4
         QaaFDByOHlZ3NmsSX01fbyoD+53HlIEbnUQIYrVbliFi5zy5NWjLSuHGZFS7SRPiWe
         XLX+gdaCI8/4Hqakd1XTKopN4U82UTMujHZv+flc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200328184958.16134-1-festevam@gmail.com>
References: <20200328184958.16134-1-festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: dac: syscon-icst: Remove unneeded unit name
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        Fabio Estevam <festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>, robh@kernel.org
Date:   Wed, 27 May 2020 17:53:24 -0700
Message-ID: <159062720498.69627.5411198594058635183@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2020-03-28 11:49:58)
> The following warnings are seen with 'make dt_binding_check':
>=20
> Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16=
-24.11: Warning (unit_address_vs_reg): /example-0/clock@00: node has a unit=
 name, but no reg or ranges property
> Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16=
-24.11: Warning (unit_address_format): /example-0/clock@00: unit name shoul=
d not have leading 0s
>=20
> Fix them by removing the unneeded clock unit name.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Rob were you going to pick this up? Doesn't look like a critical warning
to fix in v5.7 final right now.

>  Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml=
 b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> index de9a465096db..444aeea27db8 100644
> --- a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> +++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
> @@ -91,7 +91,7 @@ required:
> =20
>  examples:
>    - |
> -    vco1: clock@00 {
> +    vco1: clock {
>        compatible =3D "arm,impd1-vco1";
>        #clock-cells =3D <0>;
>        lock-offset =3D <0x08>;
