Return-Path: <linux-clk+bounces-26668-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA1B3448D
	for <lists+linux-clk@lfdr.de>; Mon, 25 Aug 2025 16:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A4413BE098
	for <lists+linux-clk@lfdr.de>; Mon, 25 Aug 2025 14:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC042FB631;
	Mon, 25 Aug 2025 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hgebqx1e"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6492222D1
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133467; cv=none; b=CkmR5t2XUx4B8C4e6fmBLtAjw94GDyhKSEPZO/qJqrd5ZXB7inCYptBQ9QoA7rzxzWFNEF+6wnugZxzy8/IINmgC4/bPfxRQz0dhENbeB934NvctxhqepIlYHoKu9N6ftVkNEeyyuHfjcUwkGP+XgOaWEm+Dah+v+FlQSVGIaag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133467; c=relaxed/simple;
	bh=J3ANI/z+4HsdJAvvOWQspzXSJhG9MP7PWNhyA1sfxS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTel6/I5y+cGgdW6TR2+br6shhrBn2+6vh2ZH8PZgeHilOBs9mnZZnQAmuzunthqfQxp2IuLpykJQrnFmcem1cvESthlKJ1vKvJpztJ+UDdjoDDOCftho94UlId5soObbEbNJYklO2b/hG/O0x08I2FAMJfa8Prp2JGmhM22nXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hgebqx1e; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f4410f7c9so1162865e87.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133461; x=1756738261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=;
        b=Hgebqx1e9b0lMNV2Q0Cwq7CI3i6PvxCc+S8JZhSzWDytISwGUsEQ3Dbnijkl3XJ+tI
         tH0FsEjTkmGxlYRlyHk0BwRUiAfjP4CZHRZhE3/ukle34sD21PbM5e9/paPpxVSpTrpg
         o3R1Wn+0cOVwo7nsaJ20mQEnpwYI5qlsVIeLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133461; x=1756738261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAVZJpgvllT4Mhe7ltBfIHVEtwo4VMq7SD8mCyRK+bY=;
        b=e3p8Kl0gtYpGOsibqTuDUtoaGDUkgPHcNVs9v6uA4NWYBo28dY9tZV3dvyzi+2K5cQ
         Wzri2jeyDiqti5adjx6iuhVM33Z7/x7kQoDWiwIa5UfmexD8Rpz9sZaDO8c/F/sjY5Cx
         7PuOhnqkQ6TsrhYxayQodrZY5j119s55ms12zyb1PKrwmnxQEvrSKTyVPmznbyCFmfrQ
         5fq8KZ1NZS6Eilu6yj35uAdF+j3kLsA5gFS1EDwAi8cF1pTNTANWD+TVv0X3UdQfcodv
         E3sttwnE3u3t0c3WljqUvmunQAb95ImCR6CUxTIgaotinI5vOILg+NQ7PMf1/HWMPqgv
         f4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUww7rzSIauE0pOQ4jcfTBGKPjE2ZOZtKn+U+Cq18ugxZ/J+lhRaZ+UUMmt+V1Yqm8/qzDyEkhh/SE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rWg9TGjIr4MpI4Y0hk+do///WJ6hUKdVocGCcMl8WfP1TR9Y
	Rrt+v62bC1+weEYoaTrY8Xe57Md8hRekZQmz5iagJgfayEzx776lIzO7YU3Y/yJjNH2Fx7gobHS
	ab3n/JB9ImYKSYeKw0MsZELj/TewwYOFi3EPw2YYv
X-Gm-Gg: ASbGncsZa4VqMXAJoOzAls0/N7lSBlEU19qwqi63du45WbmU9HKhjgKa30arkr+1EU1
	ogPqUDZ+xouSWnN49zqzaO8sEXO104LFpCIoa6+u3WcYvcyMutAs5LPIr8OidZTALtKK9Dzu9KK
	jTl/b0IqLZyQ3xkuAIUjZYxJ1kw62L7kbtSv3DpICAay/E3jH3GixvDsx6W3GTosfijyR+0uI6l
	rYF93Ce6w==
X-Google-Smtp-Source: AGHT+IEe7w9pVPejypkcEJDKdxceIu7p/7dzKMCCMCcrZIlfu17d7XkyMHIibXiLNiCq+NAGnq/H6nnnbCqYo6xbSyU=
X-Received: by 2002:a05:6512:230c:b0:55f:496e:99b1 with SMTP id
 2adb3069b0e04-55f496ea2e6mr746059e87.31.1756133461346; Mon, 25 Aug 2025
 07:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGXv+5HRKFrdjjXkwN6=OLtk=bK3C3mBnrDtmkEWeuxjz0pFKg@mail.gmail.com>
 <20250825125141.209860-1-laura.nao@collabora.com>
In-Reply-To: <20250825125141.209860-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Aug 2025 16:50:50 +0200
X-Gm-Features: Ac12FXymdIbpYgVvUuTRHx1l6uFl8EsOrYD9IbMYYkm6u39sg-0GTOO7AjUR4wY
Message-ID: <CAGXv+5HQrMY+osCZKVOq28fQi-Be-eZ=_-=5HcrkacivHekOTQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
To: Laura Nao <laura.nao@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, guangjie.song@mediatek.com, kernel@collabora.com, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	mturquette@baylibre.com, netdev@vger.kernel.org, nfraprado@collabora.com, 
	p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org, 
	sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 2:52=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On 8/15/25 05:37, Chen-Yu Tsai wrote:
> > On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.=
com> wrote:
> >>
> >> MT8196 use a HW voter for gate enable/disable control. Voting is
> >> performed using set/clr regs, with a status bit used to verify the vot=
e
> >> state. Add new set of gate clock operations with support for voting vi=
a
> >> set/clr regs.
> >>
> >> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
> >> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> >> ---
> >>  drivers/clk/mediatek/clk-gate.c | 77 +++++++++++++++++++++++++++++++-=
-
> >>  drivers/clk/mediatek/clk-gate.h |  3 ++
> >>  2 files changed, 77 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/cl=
k-gate.c
> >> index 0375ccad4be3..426f3a25763d 100644
> >> --- a/drivers/clk/mediatek/clk-gate.c
> >> +++ b/drivers/clk/mediatek/clk-gate.c
> >> @@ -5,6 +5,7 @@
> >>   */
> >>
> >>  #include <linux/clk-provider.h>
> >> +#include <linux/dev_printk.h>
> >>  #include <linux/mfd/syscon.h>
> >>  #include <linux/module.h>
> >>  #include <linux/printk.h>
> >> @@ -12,14 +13,19 @@
> >>  #include <linux/slab.h>
> >>  #include <linux/types.h>
> >>
> >> +#include "clk-mtk.h"
> >>  #include "clk-gate.h"
> >>
> >>  struct mtk_clk_gate {
> >>         struct clk_hw   hw;
> >>         struct regmap   *regmap;
> >> +       struct regmap   *regmap_hwv;
> >>         int             set_ofs;
> >>         int             clr_ofs;
> >>         int             sta_ofs;
> >> +       unsigned int    hwv_set_ofs;
> >> +       unsigned int    hwv_clr_ofs;
> >> +       unsigned int    hwv_sta_ofs;
> >>         u8              bit;
> >>  };
> >>
> >> @@ -100,6 +106,28 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
> >>         mtk_cg_clr_bit(hw);
> >>  }
> >>
> >> +static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
> >> +{
> >> +       struct mtk_clk_gate *cg =3D to_mtk_clk_gate(hw);
> >> +       u32 val;
> >> +
> >> +       regmap_write(cg->regmap_hwv, enable ? cg->hwv_set_ofs : cg->hw=
v_clr_ofs, BIT(cg->bit));
> >> +
> >> +       return regmap_read_poll_timeout_atomic(cg->regmap_hwv, cg->hwv=
_sta_ofs, val,
> >> +                                              val & BIT(cg->bit),
> >> +                                              0, MTK_WAIT_HWV_DONE_US=
);
> >> +}
> >> +
> >> +static int mtk_cg_hwv_enable(struct clk_hw *hw)
> >> +{
> >> +       return mtk_cg_hwv_set_en(hw, true);
> >> +}
> >> +
> >> +static void mtk_cg_hwv_disable(struct clk_hw *hw)
> >> +{
> >> +       mtk_cg_hwv_set_en(hw, false);
> >> +}
> >> +
> >>  static int mtk_cg_enable_no_setclr(struct clk_hw *hw)
> >>  {
> >>         mtk_cg_clr_bit_no_setclr(hw);
> >> @@ -124,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct c=
lk_hw *hw)
> >>         mtk_cg_clr_bit_no_setclr(hw);
> >>  }
> >>
> >> +static bool mtk_cg_uses_hwv(const struct clk_ops *ops)
> >> +{
> >> +       if (ops =3D=3D &mtk_clk_gate_hwv_ops_setclr ||
> >> +           ops =3D=3D &mtk_clk_gate_hwv_ops_setclr_inv)
> >> +               return true;
> >> +
> >> +       return false;
> >> +}
> >> +
> >>  const struct clk_ops mtk_clk_gate_ops_setclr =3D {
> >>         .is_enabled     =3D mtk_cg_bit_is_cleared,
> >>         .enable         =3D mtk_cg_enable,
> >> @@ -138,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv =
=3D {
> >>  };
> >>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
> >>
> >> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr =3D {
> >> +       .is_enabled     =3D mtk_cg_bit_is_cleared,
> >> +       .enable         =3D mtk_cg_hwv_enable,
> >> +       .disable        =3D mtk_cg_hwv_disable,
> >> +};
> >> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr);
> >> +
> >> +const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv =3D {
> >> +       .is_enabled     =3D mtk_cg_bit_is_set,
> >> +       .enable         =3D mtk_cg_hwv_enable,
> >> +       .disable        =3D mtk_cg_hwv_disable,
> >> +};
> >> +EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr_inv);
> >> +
> >>  const struct clk_ops mtk_clk_gate_ops_no_setclr =3D {
> >>         .is_enabled     =3D mtk_cg_bit_is_cleared,
> >>         .enable         =3D mtk_cg_enable_no_setclr,
> >> @@ -153,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_in=
v =3D {
> >>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
> >>
> >>  static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> >> -                                               const struct mtk_gate =
*gate,
> >> -                                               struct regmap *regmap)
> >> +                                           const struct mtk_gate *gat=
e,
> >> +                                           struct regmap *regmap,
> >> +                                           struct regmap *regmap_hwv)
> >>  {
> >>         struct mtk_clk_gate *cg;
> >>         int ret;
> >> @@ -169,11 +221,22 @@ static struct clk_hw *mtk_clk_register_gate(stru=
ct device *dev,
> >>         init.parent_names =3D gate->parent_name ? &gate->parent_name :=
 NULL;
> >>         init.num_parents =3D gate->parent_name ? 1 : 0;
> >>         init.ops =3D gate->ops;
> >> +       if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
> >> +               dev_err(dev, "regmap not found for hardware voter cloc=
ks\n");
> >> +               return ERR_PTR(-ENXIO);
> >
> > return dev_err_probe()?
> >
> > I believe the same applies to the previous patch.
> >
>
> mtk_clk_register_gate and mtk_clk_register_mux actually both return a
> struct clk_hw *.

Oops, you're right. If that case I believe dev_err_ptr_probe() could be
used?

ChenYu

