Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7C7E5ACD32
	for <lists+linux-clk@lfdr.de>; Mon,  5 Sep 2022 09:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237053AbiIEHzK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 5 Sep 2022 03:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236474AbiIEHzJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Sep 2022 03:55:09 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.133.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1CE175BF
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1662364501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AdS8+B/O/n4mduTrHxo0RL4fuHx8wGK9eiouBtBzHLE=;
        b=nq/Sz1Z7EABiXwAHZKYqd+Carge9I9yVZMSrZasFXAw5iMpT+xL9kqBYBTKsCI8emXOaRC
        5xCEosXDh7yh+gs1cEXpOuWwwHrKFYVAY/VyKrZCrCRA2eLG1YteZC6HSimHW+M8hkzSoT
        hfnEk80xbK9/LKXf3idMg72/DBI7bOunHmfFZI/80nEZLEEApsMvcIWLzYISLffCKGyhvo
        3DfhZzTTcIsXS4yYs39KKDk5D1fQ9GzRkypE9APQ5big6pfaA2eSxVsvYB6ckwU6IBBjSm
        IZzeUfz8NuF28TcUzgFk4FX4zQtHEFz3FUG2SYjl4bc6r56As52GzF5VbngPNw==
Received: from mail.maxlinear.com (174-47-1-83.static.ctl.one [174.47.1.83])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 us-mta-354-xdhXJq8hOTmBhXYhWCcCPw-1; Mon, 05 Sep 2022 03:44:03 -0400
X-MC-Unique: xdhXJq8hOTmBhXYhWCcCPw-1
Received: from sgsxdev001.isng.phoenix.local (10.226.81.111) by
 mail.maxlinear.com (10.23.38.120) with Microsoft SMTP Server id 15.1.2375.24;
 Mon, 5 Sep 2022 00:43:59 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-lgm-soc@maxlinear.com>,
        "Rahul Tanwar" <rtanwar@maxlinear.com>
Subject: [PATCH v2 3/5] clk: mxl: Avoid disabling gate clocks from clk driver
Date:   Mon, 5 Sep 2022 15:43:46 +0800
Message-ID: <496372f326760be1b997ae2aabd1999627f7376d.1662363020.git.rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1662363020.git.rtanwar@maxlinear.com>
References: <cover.1662363020.git.rtanwar@maxlinear.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In MxL's LGM SoC, gate clocks are supposed to be enabled or disabled
from EPU (power management IP) in certain power saving modes. If gate
clocks are allowed to be enabled/disabled from CGU clk driver, then
there arises a conflict where in case clk driver disables a gate clk,
and then EPU tries to disable the same gate clk, then it will hang
polling for the clk gated successful status.

To avoid such a conflict, disable gate clocks enabling/disabling from
CGU clk driver. But add a GATE_CLK_HW flag to control this in order to
be backward compatible with other SoCs which share the same CGU IP but
not the same EPU IP.

Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>
---
 drivers/clk/x86/clk-cgu.c | 32 ++++++++++++++++++++++++--------
 drivers/clk/x86/clk-cgu.h |  1 +
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/x86/clk-cgu.c b/drivers/clk/x86/clk-cgu.c
index 1f7e93de67bc..d24173cfe0b0 100644
--- a/drivers/clk/x86/clk-cgu.c
+++ b/drivers/clk/x86/clk-cgu.c
@@ -258,8 +258,12 @@ static int lgm_clk_gate_enable(struct clk_hw *hw)
 =09struct lgm_clk_gate *gate =3D to_lgm_clk_gate(hw);
 =09unsigned int reg;
=20
-=09reg =3D GATE_HW_REG_EN(gate->reg);
-=09lgm_set_clk_val(gate->membase, reg, gate->shift, 1, 1);
+=09if (gate->flags & GATE_CLK_HW) {
+=09=09reg =3D GATE_HW_REG_EN(gate->reg);
+=09=09lgm_set_clk_val(gate->membase, reg, gate->shift, 1, 1);
+=09} else {
+=09=09gate->reg =3D 1;
+=09}
=20
 =09return 0;
 }
@@ -269,8 +273,12 @@ static void lgm_clk_gate_disable(struct clk_hw *hw)
 =09struct lgm_clk_gate *gate =3D to_lgm_clk_gate(hw);
 =09unsigned int reg;
=20
-=09reg =3D GATE_HW_REG_DIS(gate->reg);
-=09lgm_set_clk_val(gate->membase, reg, gate->shift, 1, 1);
+=09if (gate->flags & GATE_CLK_HW) {
+=09=09reg =3D GATE_HW_REG_DIS(gate->reg);
+=09=09lgm_set_clk_val(gate->membase, reg, gate->shift, 1, 1);
+=09} else {
+=09=09gate->reg =3D 0;
+=09}
 }
=20
 static int lgm_clk_gate_is_enabled(struct clk_hw *hw)
@@ -278,8 +286,12 @@ static int lgm_clk_gate_is_enabled(struct clk_hw *hw)
 =09struct lgm_clk_gate *gate =3D to_lgm_clk_gate(hw);
 =09unsigned int reg, ret;
=20
-=09reg =3D GATE_HW_REG_STAT(gate->reg);
-=09ret =3D lgm_get_clk_val(gate->membase, reg, gate->shift, 1);
+=09if (gate->flags & GATE_CLK_HW) {
+=09=09reg =3D GATE_HW_REG_STAT(gate->reg);
+=09=09ret =3D lgm_get_clk_val(gate->membase, reg, gate->shift, 1);
+=09} else {
+=09=09ret =3D gate->reg;
+=09}
=20
 =09return ret;
 }
@@ -315,7 +327,8 @@ lgm_clk_register_gate(struct lgm_clk_provider *ctx,
 =09init.num_parents =3D pname ? 1 : 0;
=20
 =09gate->membase =3D ctx->membase;
-=09gate->reg =3D reg;
+=09if (cflags & GATE_CLK_HW)
+=09=09gate->reg =3D reg;
 =09gate->shift =3D shift;
 =09gate->flags =3D cflags;
 =09gate->hw.init =3D &init;
@@ -326,7 +339,10 @@ lgm_clk_register_gate(struct lgm_clk_provider *ctx,
 =09=09return ERR_PTR(ret);
=20
 =09if (cflags & CLOCK_FLAG_VAL_INIT) {
-=09=09lgm_set_clk_val(gate->membase, reg, shift, 1, list->gate_val);
+=09=09if (cflags & GATE_CLK_HW)
+=09=09=09lgm_set_clk_val(gate->membase, reg, shift, 1, list->gate_val);
+=09=09else
+=09=09=09gate->reg =3D 1;
 =09}
=20
 =09return hw;
diff --git a/drivers/clk/x86/clk-cgu.h b/drivers/clk/x86/clk-cgu.h
index 0aa0f35d63a0..73ce84345f81 100644
--- a/drivers/clk/x86/clk-cgu.h
+++ b/drivers/clk/x86/clk-cgu.h
@@ -197,6 +197,7 @@ struct lgm_clk_branch {
 /* clock flags definition */
 #define CLOCK_FLAG_VAL_INIT=09BIT(16)
 #define MUX_CLK_SW=09=09BIT(17)
+#define GATE_CLK_HW=09=09BIT(18)
=20
 #define LGM_MUX(_id, _name, _pdata, _f, _reg,=09=09\
 =09=09_shift, _width, _cf, _v)=09=09\
--=20
2.17.1

