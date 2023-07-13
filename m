Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF92F7519AC
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jul 2023 09:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbjGMHVw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Jul 2023 03:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbjGMHVw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 03:21:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED36E75;
        Thu, 13 Jul 2023 00:21:50 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 98A926607027;
        Thu, 13 Jul 2023 08:21:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689232909;
        bh=u9YcA9g+Tp6QjBKjdLWxvkOCj7rpVCwHbVd7kA6GR1s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BeHp9ejQV93lO9MR47q8I97gJUdUbKugtSm1sMeTqLw+0NnaWcsuZc70cbAC/mYKH
         028qyKVtJZRUt4nfDj1hK4Ay8KTuwW19HI/VskCQfT9Un3svl2yPRkb3/pLtaXQHMI
         nevCv59af8VRQlq43zQfm2ZLNBS0MHbFd3VY4MYCI6Yqc/Jo2EuZXQmSXlevjL5ior
         YsouyceRbTpSGWNElJgJpcgOpnczyytIRWqn/0zbLef7UnZixkjRJtdCSQ5pcv4mGu
         wwx9X63BCmnQg2p+WgAFbbhYcZnmVbx9jWvo0WTYkOifNiits+Umt/aWYWIKvA1z7u
         hA17KHYFZuqAg==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com,
        u.kleine-koenig@pengutronix.de, miles.chen@mediatek.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: [PATCH 1/2] clk: mediatek: clk-mux: Support custom parent indices for muxes
Date:   Thu, 13 Jul 2023 09:21:37 +0200
Message-Id: <20230713072138.84117-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for customized parent indices for MediaTek muxes: this is
necessary for the case in which we want to exclude some clocks from
a mux's parent clocks list, where the exclusions are not from the
very bottom of the list but either in the middle or the beginning.

Example:
- MUX1 (all parents)
  - parent1; idx=0
  - parent2; idx=1
  - parent3; idx=2

- MUX1 (wanted parents)
  - parent1; idx=0
  - parent3; idx=2

To achieve that add a `parent_index` array pointer to struct mtk_mux,
then in .set_parent(), .get_parent() callbacks check if this array
was populated and eventually get the index from that.

Also, to avoid updating all clock drivers for all SoCs, rename the
"main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
been reintroduced as being fully compatible with the older version.

The new parent_index can be specified with the new `_INDEXED`
variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 14 +++++++++++
 drivers/clk/mediatek/clk-mux.h | 43 ++++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index c93bc7f926e5..60990296450b 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -89,6 +89,17 @@ static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
 	regmap_read(mux->regmap, mux->data->mux_ofs, &val);
 	val = (val >> mux->data->mux_shift) & mask;
 
+	if (mux->data->parent_index) {
+		int i;
+
+		for (i = 0; i < mux->data->num_parents; i++)
+			if (mux->data->parent_index[i] == val)
+				return i;
+
+		/* Not found: return an impossible index to generate error */
+		return mux->data->num_parents + 1;
+	}
+
 	return val;
 }
 
@@ -104,6 +115,9 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 	else
 		__acquire(mux->lock);
 
+	if (mux->data->parent_index)
+		index = mux->data->parent_index[index];
+
 	regmap_read(mux->regmap, mux->data->mux_ofs, &orig);
 	val = (orig & ~(mask << mux->data->mux_shift))
 			| (index << mux->data->mux_shift);
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 7ecb963b0ec6..943ad1d7ce4b 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -21,6 +21,7 @@ struct mtk_mux {
 	int id;
 	const char *name;
 	const char * const *parent_names;
+	const u8 *parent_index;
 	unsigned int flags;
 
 	u32 mux_ofs;
@@ -37,9 +38,10 @@ struct mtk_mux {
 	signed char num_parents;
 };
 
-#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
-			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
-			_gate, _upd_ofs, _upd, _flags, _ops) {		\
+#define __GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _paridx,		\
+			 _num_parents, _mux_ofs, _mux_set_ofs,		\
+			 _mux_clr_ofs, _shift, _width, _gate, _upd_ofs,	\
+			 _upd, _flags, _ops) {				\
 		.id = _id,						\
 		.name = _name,						\
 		.mux_ofs = _mux_ofs,					\
@@ -51,11 +53,28 @@ struct mtk_mux {
 		.gate_shift = _gate,					\
 		.upd_shift = _upd,					\
 		.parent_names = _parents,				\
-		.num_parents = ARRAY_SIZE(_parents),			\
+		.parent_index = _paridx,				\
+		.num_parents = _num_parents,				\
 		.flags = _flags,					\
 		.ops = &_ops,						\
 	}
 
+#define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_gate, _upd_ofs, _upd, _flags, _ops)		\
+		__GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
+			NULL, ARRAY_SIZE(_parents), _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_gate, _upd_ofs, _upd, _flags, _ops)		\
+
+#define GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents, _paridx,	\
+			 _mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
+			 _width, _gate, _upd_ofs, _upd, _flags, _ops)	\
+		__GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
+			_paridx, ARRAY_SIZE(_paridx), _mux_ofs,		\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			_gate, _upd_ofs, _upd, _flags, _ops)		\
+
 extern const struct clk_ops mtk_mux_clr_set_upd_ops;
 extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 
@@ -67,6 +86,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 			_gate, _upd_ofs, _upd, _flags,			\
 			mtk_mux_gate_clr_set_upd_ops)
 
+#define MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,	\
+			_paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,	\
+			_shift, _width, _gate, _upd_ofs, _upd, _flags)	\
+		GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name, _parents,	\
+			_paridx, _mux_ofs, _mux_set_ofs, _mux_clr_ofs,	\
+			_shift, _width, _gate, _upd_ofs, _upd, _flags,	\
+			mtk_mux_gate_clr_set_upd_ops)
+
 #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,		\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
 			_gate, _upd_ofs, _upd)				\
@@ -75,6 +102,14 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 			_width, _gate, _upd_ofs, _upd,			\
 			CLK_SET_RATE_PARENT)
 
+#define MUX_GATE_CLR_SET_UPD_INDEXED(_id, _name, _parents, _paridx,	\
+			_mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
+			_width, _gate, _upd_ofs, _upd)			\
+		MUX_GATE_CLR_SET_UPD_FLAGS_INDEXED(_id, _name,		\
+			_parents, _paridx, _mux_ofs, _mux_set_ofs,	\
+			_mux_clr_ofs, _shift, _width, _gate, _upd_ofs,	\
+			_upd, CLK_SET_RATE_PARENT)
+
 #define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
 			_upd_ofs, _upd)					\
-- 
2.40.1

