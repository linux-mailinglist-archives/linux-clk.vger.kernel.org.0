Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6157C60D7
	for <lists+linux-clk@lfdr.de>; Thu, 12 Oct 2023 01:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjJKXGw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Oct 2023 19:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233851AbjJKXGp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 19:06:45 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5624B8
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 16:06:42 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-58d26cfe863so274079a12.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697065602; x=1697670402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=830+T/xr9uEn4yhzfFmm+l2X0cKAII88KMLpZDMLLPE=;
        b=QpiScnFImBncuHOvYPuSQyL5ByN3jBeSxYQQ5i+gFdSxWaUDy+2rqK/l76BO0oixkw
         yyvHZpKEzoi85its3NfS598Z1x5ssvA2SXkrIuLlonqg5CkgWtN3piIHuXnwrtb4lsbU
         T2/DS0LEs7C7F3rWezadzcXYW8HeziFK3b+PYNA1u5h71FV7+tDrEdJ7LSgkSPGJMttU
         wC8h2q1vO2O8USDbE6g/DFlB5lYbL3wF5Ajgp5K53qLA4p4cn3G572ss2vnDRQRfuDa6
         jcy6OXrJ56pEbaIjAgETY+PhgBzuU+J+oGoGfpDVY7PkKMOIdYjsZ1qNd4gaNRlT6rYO
         2udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697065602; x=1697670402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=830+T/xr9uEn4yhzfFmm+l2X0cKAII88KMLpZDMLLPE=;
        b=xL/tUxR2BqMQCh2836fyb9RFBMjzfPRKl7+hZv0EU+NhsHfFfO9fdKK3bLm1bbikDY
         iIjoDsMUl5+gsZU7f/HtcUyfPvb+mvtEOqRbvpGdVxq278hyMfU/lRTZNzQ2jUw6zJ/7
         c6x4b3uQJj5Qoftwmmx7ulQ/MBnCmMqZXWy/RL1cjc3JKt7+jwbj1vLJnbbblyzFdUtO
         F/LeleMleLSmm/8YRYfvz0ca2/P0GQPyRiO9CohPEqsRoMijeRkpadgsXZSIqC8CZiQY
         qG9V9+14PKeeF4SixUK9QwOh5F0IJjvCmtIpQWD7M+YT4MXiCpw9/te4pVCPB6E2aSa/
         QDcQ==
X-Gm-Message-State: AOJu0Ywp/RHc5n+QS/N1Frtd9xzW2cEGssgjDt9U8hZGzRXrYWNHY7iF
        bJZC5ljEGMU97JE2mRTqyCz6sLRDQ6mmVD55HGUDgQ==
X-Google-Smtp-Source: AGHT+IFkrUQFnZd9m9zomJjfToUWFrobK9kapcqFNH2fBvaJKzZmviD5aTDDF66CYAN9UuRyUiHFrGqywS2lm3wpxuY=
X-Received: by 2002:a17:90a:8b13:b0:274:e8e0:1503 with SMTP id
 y19-20020a17090a8b1300b00274e8e01503mr19230372pjn.16.1697065602253; Wed, 11
 Oct 2023 16:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-6-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-6-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 18:06:31 -0500
Message-ID: <CAPLW+4kK_hhkht7OPgyUCinwaEPMyVq3DJ4mnbRVkGXJvPWbwg@mail.gmail.com>
Subject: Re: [PATCH v3 05/20] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This introduces bindings and dt-schema for the Google tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Document=
ation/devicetree/bindings/arm/google.yaml
> new file mode 100644
> index 000000000000..167945e4d5ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/google.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/google.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor platforms
> +
> +maintainers:
> +  - Peter Griffin <peter.griffin@linaro.org>
> +
> +description: |
> +  ARM platforms using SoCs designed by Google branded "Tensor" used in P=
ixel
> +  devices.
> +
> +  Currently upstream this is devices using "gs101" SoC which is found in=
 Pixel
> +  6, Pixel 6 Pro and Pixel 6a.
> +
> +  Google have a few different names for the SoC.
> +  - Marketing name ("Tensor")
> +  - Codename ("Whitechapel")
> +  - SoC ID ("gs101")
> +  - Die ID ("S5P9845");
> +
> +  Likewise there are a couple of names for the actual device
> +  - Marketing name ("Pixel 6")
> +  - Codename ("Oriole")
> +
> +  Devicetrees should use the lowercased SoC ID and lowercased board code=
name.
> +  e.g. gs101 and gs101-oriole
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +

Is that empty line is actually needed here?

> +      - description: Google Pixel 6 / Oriole
> +        items:
> +          - enum:
> +              - google,gs101-oriole
> +          - const: google,gs101
> +
> +additionalProperties: true
> +
> +...
> --
> 2.42.0.655.g421f12c284-goog
>
