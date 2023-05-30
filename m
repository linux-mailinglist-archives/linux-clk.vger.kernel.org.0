Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8B6B7156ED
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 09:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjE3HiT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 03:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjE3HiS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 03:38:18 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D0E90
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:15 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so4114764f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432294; x=1688024294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=476AxUierLRK4+ZG9hRPuJ7U/N2yV0VbuQqiR2vx9v0=;
        b=eUwYySEneFJaqAhOF+RDy+Hozw4StptRqWTaWNs9bSyf6g4rPStLSAyuymBQCJJXIU
         kGZYFThmLrepXTx7LYbMZXOgIa98HIZslaVPfKFJDUeFam4hFD+RpOU2mBJP1PkKRQ0w
         JPpyJAtgv4ZW6GxLUxS3llZbGgjR7Po0lrUizPYZ/gMPS8HuZuV2zY2ZxFGTMaI9Ahz/
         XyciH6yeW2TP9pW3F7sYSvF1mXR/amdmwjA2w5lJzcXXKuMwRYJb3UvyRMppcb/sf42h
         AGoNOam75ZPqJs6CSce9gzhw9Ton3PemMND0M4Zd32wfH2OqTbMjkkaYK2/02ywbQhyS
         qtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432294; x=1688024294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=476AxUierLRK4+ZG9hRPuJ7U/N2yV0VbuQqiR2vx9v0=;
        b=OfOHFHtdoUkUx0F8MX0mrXTCFUzOBlveeI2QXfw1CzbyIy6vtd/JpoBLrl/HYsI3qM
         6iPD3ThGHo7uR+tVHHQ3mX47K7zfgzAM41lb0ihEbn1i6R6TcTfqIQuO9y1otsLPY1Oz
         /tEGXYBpsBCfS49o8smxCXtGOxI122xHxXElXXze6l+b7BvS3ASlW+CW2W2U0bXIb1RM
         aKXek1kNgfJdBtT0lEoUaV3VuHVhlPYNWzT9zInBkoZfWd2QDTwWsnF/L2gwklqXApeu
         Lvfk/6xQC0rQ7j4weRGSgjnjW9A6NhLmURa8AktXPEmL7/I98P4mXNYtY1vCwstv1XuC
         HBoQ==
X-Gm-Message-State: AC+VfDxKAXtJLrOLjdpFS7nK8IdzC07CagF9/Wv+3Ec5MQmNQJ8xPtJB
        D7RdIMJoLUV6rvfeB2UmTZKlBg==
X-Google-Smtp-Source: ACHHUZ67lJaUzF+ILVnlLsfXZNNq9AQCoX59cJjoKT9BoX55NwsUlW97Hfd6EXX3GNjQs8+fAMXqgQ==
X-Received: by 2002:a5d:4cc6:0:b0:309:5119:7259 with SMTP id c6-20020a5d4cc6000000b0030951197259mr791629wrt.20.1685432293767;
        Tue, 30 May 2023 00:38:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:13 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 00/17] drm/meson: add support for MIPI DSI Display
Date:   Tue, 30 May 2023 09:38:01 +0200
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANmndWQC/5WOQQ6CMBBFr0K6dgwMLYor72FYlDLAJNCSFhoN4
 e5WbuDyvcV/fxeBPFMQj2wXniIHdjaBumTCjNoOBNwlFphjmasCQc+TG9hArEDCtoTVk56hCwz
 G9BB5LqG9k8LiRkUvtUhDrQ4ErdfWjGnKbtOU5OKp5/dZfjWJRw6r85/zSJQ/+1czSsgBVY0Ga
 9JYlc+Jrfbu6vwgmuM4vvjRpmnqAAAA
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     "Lukas F. Hartmann" <lukas@mntre.com>,
        Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6362;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oQMdk5F8XpnE3SYBlSID8iORyMOnjExbfiSGn2cC2+0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafdKfQS8TTa1xAJxHU0d//Z1eaCq7EL6+16Uwj4
 OKpT/KmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn3QAKCRB33NvayMhJ0TG7D/
 9H/He0su5ZqIg29fy7rJBr0AQgQ/Hnp57ThWTB8wSYUmsvSpfevGxPnX0QCwNXvvtsumJM6gX7vgTR
 pBRQFUHx0g/w5xyDV2cDzcF9NhxikO5YJf8bIEYjS5OAMFStT+jCyx15xjKZdHtjm3H2VDEo1jVGdD
 hz8K3N3lA6xpqVauuS4HzdDgO6QP6eqXNfFCOrD4E22OoFYxdWsGJbq1pWf2uuIFDQB3x1FcT1VLOi
 qdVnOLXzBaK068i/OeBUS2LxGtrpNsG5bxgGjv2DVxYUBKxNEHnhGZBe1W3wBaNRv7RVZ3GmLw3TTq
 yD3LxE4l0CNfBywDyXT1dphm4ahIMLEDSxij2DU0ApeuriZN6S+xLZzZDiKIgWvXL42otKrfnIPqHl
 EZaS5ljkGAcrhnax5Lp2K72K1Kc00L0U9OOHmN0Te6iCZvjFx0wlkUG9GSNy8zT4cOuA19heqD1pdC
 pwq1Aa20SuVw18oE22nd08six36jCf+/gaWNh9mSZXf2a21zS7g10fb6BqmaT4GDUqkYW2mT6rpDMX
 57uELt+gPRdT+HR8Ly7H6I3tKmJHZODHVA4MRFr5Hy4n8cAMSyF35bv4ZBG/ySKXUkTe8chX47nChV
 bMtwKcSz0D8d5IQUXJxlHQBM10yzNQxY9xFsgoBgHZI6aDjsI6qgQJs3DjqQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This adds support for the glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

This patchset is based on an earlier attempt at [1] for the AXG SoCs, but:
- previous glue code was a single monolitic code mixing encoders & bridges, this version
  is aligned on the previous cleanup done on HDMI & CVBS bridges architecture at [2]
- since the only output of AXG is DSI, AXG VPU support is post-poned until we implement
  single-clock DSI support specific case on top of this.

This is a re-spin of v3 at [5], the main change is about clock control, the clock
setup has been redesigned to use CCF, a common PLL (GP0) and the VCLK2 clock
path for DSI in preparation of full CCF support and possibly dual display with HDMI.

I kept review tags when the content was only slighly changed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Aded PRIV all the G12 internal clk IDS to simplify public exposing
- Fixed the DSI bindings
- Fixed the DSI HSYNC/VSYNC polarity handling
- Fixed the DSI clock setup
- Fixed the DSI phy timings
- Dropped components for DSI, only keeping it for HDMI
- Added MNT Reform 2 CM4 DT
- Dropped already applied PHY fix
- Link to v4: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org

Changes from v3 at [5]:
- switched all clk setup via CCF
- using single PLL for DSI controller & ENCL encoder
- added ENCL clocks to CCF
- make the VCLK2 clocks configuration by CCF
- fixed probe/bind of DSI controller to work with panels & bridges
- added bit_clk to controller to it can setup the BIT clock aswell
- added fix for components unbind
- added fix for analog phy setup value
- added TS050 timings fix
- dropped previous clk control patch

Changes from v2 at [4]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [3]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com
[5] https://lore.kernel.org/r/20220617072723.1742668-1-narmstrong@baylibre.com

---
Neil Armstrong (17):
      clk: meson: g12a: prefix private CLK IDs defines with PRIV
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      dt-bindings: clk: g12a-clkc: add VCLK2_SEL and CTS_ENCL clock ids
      clk: meson: g12: use VCLK2_SEL, CTS_ENCL & CTS_ENCL_SEL public CLK IDs
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
      dt-bindings: display: meson-vpu: add third DPI output port
      drm/meson: fix unbind path if HDMI fails to bind
      drm/meson: only use components with dw-hdmi
      drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
      drm/meson: add DSI encoder
      drm/meson: add support for MIPI-DSI transceiver
      drm/panel: khadas-ts050: update timings to achieve 60Hz refresh rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
      dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 118 +++
 .../bindings/display/amlogic,meson-vpu.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 388 ++++++++++
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  76 ++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
 drivers/clk/meson/g12a.c                           | 791 ++++++++++++---------
 drivers/clk/meson/g12a.h                           | 261 ++++---
 drivers/gpu/drm/meson/Kconfig                      |   7 +
 drivers/gpu/drm/meson/Makefile                     |   3 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  62 +-
 drivers/gpu/drm/meson/meson_drv.h                  |   1 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          | 352 +++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h          | 160 +++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c          | 174 +++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h          |  13 +
 drivers/gpu/drm/meson/meson_registers.h            |  25 +
 drivers/gpu/drm/meson/meson_venc.c                 | 211 +++++-
 drivers/gpu/drm/meson/meson_venc.h                 |   6 +
 drivers/gpu/drm/meson/meson_vpp.h                  |   2 +
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  16 +-
 include/dt-bindings/clock/g12a-clkc.h              |   3 +
 25 files changed, 2262 insertions(+), 488 deletions(-)
---
base-commit: 8c33787278ca8db73ad7d23f932c8c39b9f6e543
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

