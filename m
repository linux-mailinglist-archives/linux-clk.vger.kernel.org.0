Return-Path: <linux-clk+bounces-1205-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5480D1FD
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 17:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB2AFB20EAB
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 16:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923061D535;
	Mon, 11 Dec 2023 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqnSl9xk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724699E
	for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 08:36:19 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b27726369so49503035e9.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 08:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312578; x=1702917378; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bK1lX1hwHqRE0qWwNG1aUzZucX1tBAoUd44IP9gaN34=;
        b=oqnSl9xk2RTxEzD6yma+xPajtnZb4XBh3BBnBDKAKEPUAM2omQ7B1U9RCKM5K+duWl
         UM7GY0xkGuUFhfqq6TDZF9Wd/vPPLm7fJyGi6DMulMyxoYe4ewT9toCLqRirkW8/CpJD
         0rWsm57VT/Q7jYcVEnuGfA/8w+bUf9NHJ3mfAwp/I9BP4yIbFx1wKbqgc1WbIPiP4IRz
         2cnJB+gi8rP6rDaxZFeXnwYfgSJT6Bqh/hDig0vjxnoFJxvo03142EP4R+NSCoWWpc3X
         9u+WICBhxruqK/9ZGVCkw0qGkSxQ0hH7rZTpkYQX+ZKgk8n07ftc6Y3aZ4yG6qF2Qmcd
         FG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312578; x=1702917378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bK1lX1hwHqRE0qWwNG1aUzZucX1tBAoUd44IP9gaN34=;
        b=SJvxWoXHdwe1Zmy99gUc/CxYTsMBlVAzB5UXa1QzOR95EDeuqW1psDyZ2oM5EsYIZe
         zVwh1sx6pt5R6BJPe3TXBr8Sb7ozEFxqsXDbJ67e+kqObhr6Atu3ZcnwdAtyfFZWaJ3p
         xeU7z9x6KMdHJv/IxJ6IQ7GF8ntq1faGiIH3JtFzV8F+c8Nvsgz8sKl38FWW6+Ks+Ac1
         gpj4qKEQn7MVflKNNCeYLBBTYYlxFxhigwYEX3QH1eSLDwj28hfmXI6a7Ro0+Ep4Y/1e
         hNXQGb1acrcrnGunZyNMzBEVAIBEIA5BhOQE+KUL3etEBNcwuXyF7q2ErEE2p50DaE04
         I53w==
X-Gm-Message-State: AOJu0YzOTbjBbzYBofwz23BandVqNe19IasgstJhrK9/0nHHWoQoqdVV
	EUZop8ITjpvvLWMw7hzw4R+m3A==
X-Google-Smtp-Source: AGHT+IHqlghak/z1rUpsIZnKDYLf/Lji2enrhgj53Kac2omQn554ooTGIUHbzfez0RtduglMO9UMiw==
X-Received: by 2002:a05:600c:510e:b0:40c:67a:b3bc with SMTP id o14-20020a05600c510e00b0040c067ab3bcmr2342567wms.71.1702312577700;
        Mon, 11 Dec 2023 08:36:17 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b0040c41846919sm7404061wmo.41.2023.12.11.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:36:17 -0800 (PST)
Message-ID: <f3299aaf9392aaedf8cca1c4756605b11c59b98f.camel@linaro.org>
Subject: Re: [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix
 incorrect numbering and DGB suffix
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Mon, 11 Dec 2023 16:36:15 +0000
In-Reply-To: <20231211162331.435900-7-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	 <20231211162331.435900-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-12-11 at 16:23 +0000, Peter Griffin wrote:
> 166 was skipped by mistake and two clocks:
> * CLK_MOUT_CMU_HSI0_USBDPDGB
> * CLK_GOUT_HSI0_USBDPDGB
>=20
> Have an incorrect DGB ending instead of DBG.
>=20
> This is an ABI break, but as the patch was only applied yesterday this
> header has never been in an actual release so it seems better to fix
> this early than ignore it.
>=20
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock manageme=
nt unit bindings")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


