Return-Path: <linux-clk+bounces-2281-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D582860C
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 13:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44765285A6E
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 12:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F8A38DC9;
	Tue,  9 Jan 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chSnIHus"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44990381CF
	for <linux-clk@vger.kernel.org>; Tue,  9 Jan 2024 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbdb124491cso2179122276.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jan 2024 04:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704803446; x=1705408246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6bnxa+GSR1FpCAvVqbsQV97G8p0dAq+kFC9sgXphqE=;
        b=chSnIHusUnwn3XCrUTGLl/woFUhegzPC+/qykv4jRfXUGqRo//F7oY6CKp7Ssy6iYA
         b1HGiRoyj77jg3J4ZSuJcQ1U0aAgpZogjKM5C1Kue04YzIfW0IpaPvdifHezeC9XfmJr
         L/ViysLijTicR+FY22YHpCtiDyUtFbNy2rcFlivO2XUDLv8kFRUrak8LOI23rPqypVVT
         tz/letFnoDyMKLsj5Ise4CkaJS1Lgg/ZEMwxpz7LzKtZmdV5QiiXcqiSb6XH+jD/eQ54
         ZWLSkP+EMLHhGSdFvbG6h+dEvmx5/BqryPukhdMNFGmTgwHfBZTpJmCzWYe38ZS+/X1o
         2s/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704803446; x=1705408246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6bnxa+GSR1FpCAvVqbsQV97G8p0dAq+kFC9sgXphqE=;
        b=l+YR0xEspPuTo+KyNyhAH5yXQvszERzQGJLK1RriOpHgwNdOEOqTLFJxexV8YFvDNO
         eg01gncgLFzMVeqDBsE5gOPbWhoEXxMDSB5Qqv3Bo654/++bSoHc4v0QMr8VxYpY81se
         cd/n2POKFzJsAiLxFHP39nxzzcM01lzcxgw09+h/PPjAAefBR+kToUj2o+ckX/duQO/M
         1ObVUlTd5zDb47AXrp3dvlx8G/osIcGkaLeSBb+NK/VD+dIFp6k1ilFzTyalLGYZ/utx
         zWaB4qT2BqtiKhJKWir20VjsiNCoC7yKIwd7EIPMS/9fWOLlRN1mb+bGjhDHRsxkU3Fg
         wCug==
X-Gm-Message-State: AOJu0YzVqt6ZDtrAr3OaOzBYQu+CY0ZIeDMzn0ZmMFUsJG1YLUNqGkVE
	bxF9+nvLe9Md4cVWNbaZnSOczezCrhZJXvaX8D07g0Bbx2KrnA==
X-Google-Smtp-Source: AGHT+IH/VCIVPEpFPTboTJrdPUTfNhyfiSowrYT19rYtTyqugjFXBvGgie/pxBxc7jOwlQ5dtHwAfNwOTFIHyTrVnOY=
X-Received: by 2002:a25:1908:0:b0:dbc:ed55:dd7b with SMTP id
 8-20020a251908000000b00dbced55dd7bmr248450ybz.36.1704803446144; Tue, 09 Jan
 2024 04:30:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp> <bc794e2165244bd0cee81bc0106f1e2d1bef1613.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <bc794e2165244bd0cee81bc0106f1e2d1bef1613.1704788539.git.ysato@users.sourceforge.jp>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jan 2024 13:30:34 +0100
Message-ID: <CACRpkdYLsf-uWdMCTpieji7u1-H3oTGojvC4xm7Erox97XJ6RQ@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 17/37] dt-bindings: interrupt-controller:
 renesas,sh7751-intc: Add json-schema
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Lee Jones <lee@kernel.org>, 
	Helge Deller <deller@gmx.de>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chris Morgan <macromorgan@hotmail.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, David Rientjes <rientjes@google.com>, Baoquan He <bhe@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Azeem Shaikh <azeemshaikh38@gmail.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng@tinylab.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-ide@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoshinori,

thanks for your patch!

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:

> +  renesas,icr-irlm:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: If true four independent interrupt requests mode (ICR.I=
RLM is 1).
> +
> +  renesas,ipr-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      IRQ to IPR mapping definition.
> +      1st - INTEVT code
> +      2nd - Register
> +      3rd - bit index

(...)

> +            renesas,ipr-map =3D <0x240 IPRD IPR_B12>, /* IRL0 */
> +                              <0x2a0 IPRD IPR_B8>,  /* IRL1 */
> +                              <0x300 IPRD IPR_B4>,  /* IRL2 */
> +                              <0x360 IPRD IPR_B0>,  /* IRL3 */
(...)

Is it really necessary to have all this in the device tree?

You know from the compatible that this is "renesas,sh7751-intc"
and I bet this table will be the same for any sh7751 right?

Then just put it in a table in the driver instead and skip this from
the device tree and bindings. If more interrupt controllers need
to be supported by the driver, you can simply look up the table from
the compatible string.

Yours,
Linus Walleij

