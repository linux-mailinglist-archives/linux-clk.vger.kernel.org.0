Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E137BCE01
	for <lists+linux-clk@lfdr.de>; Sun,  8 Oct 2023 13:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbjJHLNt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 8 Oct 2023 07:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234311AbjJHLNs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Oct 2023 07:13:48 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D79AAC
        for <linux-clk@vger.kernel.org>; Sun,  8 Oct 2023 04:13:46 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso599850966b.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Oct 2023 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1696763624; x=1697368424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDluQS60ilpfpuw8LSy/Bxf7lkTMWAw31oo0Cn9rzKA=;
        b=fcnU4So/heUjSRTgel4mX2tBQ9cJSFX62yr+LffeZ8B90zH25YqnRbmq22R2m6SFeU
         4MA2JEYVzwAdM3ouaYfDMxdveVkEzftvylzGaksJKffX016qjBd7znGIyNy4Ky5Zzh4Q
         nrXcMYIj+Yl4La3NPzt6p17H4Nwwy86POsYrkl4B2MCDHkr/mzV9kNM5Aig17DDvddOT
         mlW9mB2v+aYnDgt4otIXkzeiSUCO+M43kGpNH68AGeRHLM4KigWmxoTUNRb18mY2ikBg
         0aLx1Q6gZZyfAI2WkUl8ickJBOJhvbzaFb2xQpiWYc5cGh6m4xrYFJag5WO5Ruz1uKv1
         06Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696763624; x=1697368424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDluQS60ilpfpuw8LSy/Bxf7lkTMWAw31oo0Cn9rzKA=;
        b=kO66I2rFoU+8MkVKqGVwi9O2lq2fjw6xNfjkX9xzMhzirEt/bphD5NZ2pCr3pWxeZy
         X08Mzzy9ly9XbXFEbRaPgeJHlllXqV81zDiPque32Cqe/H/rwfZTqnMVNWDO1iBh5A9F
         e2tHoV7FXSOpRbI98CDOySmVuo0tKvqcqhej3fEMseAQ6OofaXsn6RoXgm6VWvwpNHqb
         9rDHDudJFHBdKEiBkjnCl0U/b5MqXsZ9KX8wRG/rDX06SiRyNzektJBW7v61A83cHRPH
         mhUcIfXZ4LDG+8xfY4PHMoVgxb8XmFtScHal9SWK6RnNNYyGA0R7O4CX+q3jIaWkw3XL
         nneA==
X-Gm-Message-State: AOJu0YwaBmD1ORilWdi8hv67GT02lW0WZfHTMARqPaFkg4sobURVJD2w
        02oH4NDSIIdmww2jmANZ4vfGag==
X-Google-Smtp-Source: AGHT+IFemXzAb5XH6+S2TspCh01ek3kyjYlyYPdoYZFDVq6ouNvKicpcsCbvmiWKkdQ1E3yY3cA9Lw==
X-Received: by 2002:a17:907:1dd7:b0:9ae:48df:2235 with SMTP id og23-20020a1709071dd700b009ae48df2235mr10994965ejc.55.1696763624505;
        Sun, 08 Oct 2023 04:13:44 -0700 (PDT)
Received: from capella.localdomain (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id t3-20020a1709064f0300b009b928eb8dd3sm5383396eju.163.2023.10.08.04.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 04:13:44 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] clk: si5351: add option to adjust PLL without glitches
Date:   Sun,  8 Oct 2023 13:09:36 +0200
Message-ID: <20231008111324.582595-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

This series intends to address a problem I had when using the Si5351A as
a runtime adjustable audio bit clock. The basic issue is that the driver
in its current form unconditionally resets the PLL whenever adjusting
its rate. But this reset causes an unwanted ~1.4 ms LOW signal glitch in
the clock output.

As a remedy, a new property is added to control the reset behaviour of
the PLLs more precisely. In the process I also converted the bindings to
YAML.

Changes:

v2 -> v3:

- address further comments from Rob:
  - drop unnecessary refs and minItems
  - simplify if conditions for chip variants
  - ignore his comment about dropping '|', as line would be >80 columns
  - move additionalProperties: false close to type: object
  - define clocks/clock-names at top-level
- drop patch to dove-cubox dts per Krzysztof's comment - will send
  separately
- collect Sebastian's Acked-by

v1 -> v2:

- address Rob's comments on the two dt-bindings patches
- new patch to correct the clock node names in the only upstream device
  tree using si5351

Alvin Šipraga (3):
  dt-bindings: clock: si5351: convert to yaml
  dt-bindings: clock: si5351: add PLL reset mode property
  clk: si5351: allow PLLs to be adjusted without reset

 .../bindings/clock/silabs,si5351.txt          | 126 --------
 .../bindings/clock/silabs,si5351.yaml         | 268 ++++++++++++++++++
 drivers/clk/clk-si5351.c                      |  47 ++-
 include/linux/platform_data/si5351.h          |   2 +
 4 files changed, 314 insertions(+), 129 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/silabs,si5351.txt
 create mode 100644 Documentation/devicetree/bindings/clock/silabs,si5351.yaml

-- 
2.42.0

