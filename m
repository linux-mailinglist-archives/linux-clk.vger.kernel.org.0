Return-Path: <linux-clk+bounces-1153-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26680BE2E
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 00:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D2B280A1E
	for <lists+linux-clk@lfdr.de>; Sun, 10 Dec 2023 23:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5611DFE6;
	Sun, 10 Dec 2023 23:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBZP7cvv"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D11EED
	for <linux-clk@vger.kernel.org>; Sun, 10 Dec 2023 15:34:28 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d0a7b72203so33880435ad.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Dec 2023 15:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251268; x=1702856068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9inBJnm4RRUBTcM8clVN2K31CIq5Yi4neoBQMqj3lw=;
        b=SBZP7cvvFTSc9dI5gyrQgoKBpoDkSuyp74A1pRYFlCFK/YJUOCZ5McPZ/cpAWcESW9
         NgEJ+FvXNkbdUxyqNcj3NDey/amslkAKWQMymlPDaqMGsoAjCr7HArraw1C8EsTpTU0A
         vR5+v2lq0vQ81zlLU0SDHqneUXN5tOuiwn3kEMfDCLem8VnGArqo5yKh6WJFKPfRSthk
         TbRd7Gu57v8oCBcZJvu1UOysWTt+VO0jAsbcXbaKf0zAC7v/Fn8IAyXypjIsHeIGd640
         o5Htg9Pe9+3Y8oBxx4+DL2sKIVfYIBthnIAOoSBv+rWHwJ7vFHJWTU7vT1vT19sX6SGk
         iOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251268; x=1702856068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9inBJnm4RRUBTcM8clVN2K31CIq5Yi4neoBQMqj3lw=;
        b=rLYeGBTpbDqUIGoEShCBdC2TeNHjvWHaR7Ez3KxJawPfP5X+KU7ePn0a/qwWwxjp9C
         xgi4rXIhkm5LXnHb+zgvM1xcGieT/I4oLMOn4bhk5pqCQbNB/LvpAb1taq/YXTgs9rq3
         zRLsN2rHa3k6DSJBBYqwzuWxwOyv0ByFIArpbOuljK5QR+911I7uRIfl/89Py8HA0aCs
         J+O5rLafxnDjNL4scMofuk5vr1BKI13BI7pL/yawgZGH7BcsqcJ4ok8VcnDNxLWwMEB0
         I4qTO5zfbnwQPTkPbO53t7pCqFt/3i/nPBXJD8MHzDinDbCJJbD7YeWAgehPaljaByXs
         BFbg==
X-Gm-Message-State: AOJu0YzHxWsLsjDOJvylE0olK7Nu/sbodAWE/WXJY3DITaIc2gozPjA0
	uTszKTm9frFsCcsc182UWJGVNeaqBqv5PBJ6J34Lng==
X-Google-Smtp-Source: AGHT+IGc+IvHTENHJ/KXFFp2iBYPliL5WTdTBJgCg+tz9DwtfoGQRHQ4N7s/di11rwfak1O7RMTB2P48Vdkm1Es9RHA=
X-Received: by 2002:a17:90a:94c7:b0:286:7f04:23c0 with SMTP id
 j7-20020a17090a94c700b002867f0423c0mr2376721pjw.4.1702251267601; Sun, 10 Dec
 2023 15:34:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-10-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-10-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:34:16 -0600
Message-ID: <CAPLW+4mztK2HEKh5S--tdi0p8i5sYOHHBoTFnfH=9X+vMXxOuQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize a required property
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 5:31=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Specifying samsung,uart-fifosize in both DT and driver static data is err=
or
> prone and relies on driver probe order and dt aliases to be correct.
>
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
>
> For google,gs101-uart make samsung,uart-fifosize a required property.
> For this platform fifosize now *only* comes from DT.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index ccc3626779d9..65d5d361e8f4 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -133,6 +133,16 @@ allOf:
>              - const: uart
>              - const: clk_uart_baud0
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - google,gs101-uart
> +    then:
> +      required:
> +        - samsung,uart-fifosize
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.43.0.472.g3155946c3a-goog
>

