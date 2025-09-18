Return-Path: <linux-clk+bounces-27334-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 144EDB44C9E
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 06:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B00891C269F1
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 04:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A25258ED7;
	Fri,  5 Sep 2025 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l7cQTifw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44222A4FE
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 04:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757045523; cv=none; b=Yo3WLFRx/1eN1T97zo3GJUZKgSJI7q2TeXNukfiVO+9930Y1XFeA3QdHgd8N5dtchBxq1+jIa9LuUWKG6rVYG0yMzdY+vwOjPSODYHxmeK1a17gri1IXHPYqJsTe0g9qZedUU0fKcMwiUXwpfNWMcjcDJ79F2g0l7ETMiB9rvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757045523; c=relaxed/simple;
	bh=GzadoSFoHf9ktPEx0Sr+SSQSuPfeH8BntcvB+4d6yPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwyxAGFF7VxMYQ7RRKV3DRTSNFs0wUV48iQdyuooD/hM0VIfshshV1jRRbvaseAE5rKyFv8YZspW9AgDt1kdvvzHJojSw4Z2RFlTXVuNcLg21qYglPgtekDp8XgjxfpUN1mjwIQN4Axh1l/Q878JQxmSa1uNfG37zAb4pa0htM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l7cQTifw; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso14581071fa.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045519; x=1757650319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=;
        b=l7cQTifwxjqS/Xi9q2iEcfedDQqgxZKIgy+zW1UQOi1JbBvTpMTG0jIxdKn5mI476l
         0lSKDpkh+kGoXPMHwW5llWOWPkyCKs0oh/Aut+Q5AYmzCWs6JswvJcjHyCXPiyGTQO6Y
         CcFe5ENXN855ojWzAnn6AiO29dLqZD8n6+X6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045519; x=1757650319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B01bmRXAH2QxWeqvPvWQshPIhSklJV5XtS7pyRMi7sU=;
        b=joUu3HsE6hPajR69abKfK5TrrwmiXnwMw5y2/j7rElWxr1AdiTpkx9iA+c9dxtJFWr
         GKke37RN4pnKlVkATifoJXlpQg4J+FxT9cMq6n5zWeGh4K94oH9LPvtLi0+Xn1DuPX5P
         bBbPy52Y20segD5T4YBG0qIIw0X4ocphrBoZBeJwVQE71vgUMc7PAEwCQP0UbwuzBbjz
         9jEj0YvRG9iBiqgT9dpkbPk6dbOok+QzsK111lQQ5zwxIePFvz5AuFICmQXs1PZmGsDD
         bfG6iDlagKqyLx5mMimXZWv+a3LGWjzhZ8SETmN5I1bUN+KS8F4GQKjDCbxYaJaFjtFH
         ekfg==
X-Forwarded-Encrypted: i=1; AJvYcCVZGlSMkM+1XrUtZGtzh0fZzVRv5+gnL0PUlBUGc/SBbpEsTjNVNihnCEB1mQYmQrfqJXgbHeS26tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YySnt8YOkXhdbR0FbOXPKughVculnaZAP5CagLgs3rdf/G3JKM8
	GvKHi7Oi6eZL4CI17D4Ja6v3iqH3ekakhUpyGMJ7nQ7fRwB1V8yRgrlTcxjmaS/APEAdT45jwnl
	dhqXHbYVyq9G6Xweyn9V/JEzLBImCjxHLSewLodwb
X-Gm-Gg: ASbGncvjLjl8e0qwowmJHI9yiR6ExxgWFLWuhKsM1nwG1VgGyw2qjwozyUvFdv7zyVg
	bGXTa1iavePgPOkxVtksQKUtwVnOv90te0w/G/LFsdQU7Mzgp8tFKj+hqEkM8FEkFrWGK5ztee0
	j4rMwf+XURdi9q/WOPLBiEAb/aQ8GNwl9tp6Jocndr1RkOZ1/KwPduaHrneNmZX2dK/+Ig/1m1N
	4+lzkxugKtyxlT+bfYsgsFmwPWiegjMksoCUQ==
X-Google-Smtp-Source: AGHT+IHYbfT4YDZymjaehpt2dXCn45+LCQHpybmvo8P6U3yHsdZLz6BM1N5npkfa7ulF9V213ctJPW+ye/twek7OL9E=
X-Received: by 2002:a2e:b88e:0:b0:336:831d:9e00 with SMTP id
 38308e7fff4ca-336caafcd05mr54910501fa.25.1757045519418; Thu, 04 Sep 2025
 21:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-6-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:11:48 +0800
X-Gm-Features: Ac12FXxJqW2o_w5uvmk3WVayIoiyKNEplrPyOCeaEvIjyu6tO3A5A0cEjAtjJqA
Message-ID: <CAGXv+5HaKD_2oUnYkRX+AswFre__ZKah27=+c-RH_W_J5Gio3A@mail.gmail.com>
Subject: Re: [PATCH v5 05/27] clk: mediatek: clk-mux: Add ops for mux gates
 with HW voter and FENC
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 use a HW voter for mux gate enable/disable control, along with a
> FENC status bit to check the status. Voting is performed using
> set/clr/upd registers, with a status bit used to verify the vote state.
> Add new set of mux gate clock operations with support for voting via
> set/clr/upd regs and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 +
>  drivers/clk/mediatek/clk-mux.c | 73 +++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/clk-mux.h | 42 +++++++++++++++++++
>  3 files changed, 116 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index 11962fac43ea..c381d6a6d908 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -20,6 +20,8 @@
>
>  #define MHZ (1000 * 1000)
>
> +#define MTK_WAIT_HWV_DONE_US   30
> +
>  struct platform_device;
>
>  /*
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mu=
x.c
> index 3931d157b262..2c2679e158e7 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/compiler_types.h>
>  #include <linux/container_of.h>
> +#include <linux/dev_printk.h>
>  #include <linux/err.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> @@ -15,6 +16,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>
> +#include "clk-mtk.h"
>  #include "clk-mux.h"
>
>  #define MTK_WAIT_FENC_DONE_US  30
> @@ -22,6 +24,7 @@
>  struct mtk_clk_mux {
>         struct clk_hw hw;
>         struct regmap *regmap;
> +       struct regmap *regmap_hwv;
>         const struct mtk_mux *data;
>         spinlock_t *lock;
>         bool reparent;
> @@ -119,6 +122,41 @@ static int mtk_clk_mux_is_enabled(struct clk_hw *hw)
>         return (val & BIT(mux->data->gate_shift)) =3D=3D 0;
>  }
>
> +static int mtk_clk_mux_hwv_fenc_enable(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +       int ret;
> +
> +       regmap_write(mux->regmap_hwv, mux->data->hwv_set_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap_hwv, mux->dat=
a->hwv_sta_ofs,
> +                                             val, val & BIT(mux->data->g=
ate_shift), 0,
> +                                             MTK_WAIT_HWV_DONE_US);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_read_poll_timeout_atomic(mux->regmap, mux->data->f=
enc_sta_mon_ofs,
> +                                             val, val & BIT(mux->data->f=
enc_shift), 1,
> +                                             MTK_WAIT_FENC_DONE_US);
> +
> +       return ret;
> +}
> +
> +static void mtk_clk_mux_hwv_disable(struct clk_hw *hw)
> +{
> +       struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> +       u32 val;
> +
> +       regmap_write(mux->regmap_hwv, mux->data->hwv_clr_ofs,
> +                    BIT(mux->data->gate_shift));
> +
> +       regmap_read_poll_timeout_atomic(mux->regmap_hwv, mux->data->hwv_s=
ta_ofs,
> +                                       val, (val & BIT(mux->data->gate_s=
hift)),
> +                                       0, MTK_WAIT_HWV_DONE_US);
> +}
> +
>  static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
>  {
>         struct mtk_clk_mux *mux =3D to_mtk_clk_mux(hw);
> @@ -190,6 +228,14 @@ static int mtk_clk_mux_determine_rate(struct clk_hw =
*hw,
>         return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
>  }
>
> +static bool mtk_clk_mux_uses_hwv(const struct clk_ops *ops)
> +{
> +       if (ops =3D=3D &mtk_mux_gate_hwv_fenc_clr_set_upd_ops)
> +               return true;
> +
> +       return false;
> +}
> +
>  const struct clk_ops mtk_mux_clr_set_upd_ops =3D {
>         .get_parent =3D mtk_clk_mux_get_parent,
>         .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> @@ -217,9 +263,20 @@ const struct clk_ops mtk_mux_gate_fenc_clr_set_upd_o=
ps =3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_mux_gate_fenc_clr_set_upd_ops);
>
> +const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops =3D {
> +       .enable =3D mtk_clk_mux_hwv_fenc_enable,
> +       .disable =3D mtk_clk_mux_hwv_disable,
> +       .is_enabled =3D mtk_clk_mux_fenc_is_enabled,
> +       .get_parent =3D mtk_clk_mux_get_parent,
> +       .set_parent =3D mtk_clk_mux_set_parent_setclr_lock,
> +       .determine_rate =3D mtk_clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(mtk_mux_gate_hwv_fenc_clr_set_upd_ops);
> +
>  static struct clk_hw *mtk_clk_register_mux(struct device *dev,
>                                            const struct mtk_mux *mux,
>                                            struct regmap *regmap,
> +                                          struct regmap *regmap_hwv,
>                                            spinlock_t *lock)
>  {
>         struct mtk_clk_mux *clk_mux;
> @@ -235,8 +292,14 @@ static struct clk_hw *mtk_clk_register_mux(struct de=
vice *dev,
>         init.parent_names =3D mux->parent_names;
>         init.num_parents =3D mux->num_parents;
>         init.ops =3D mux->ops;
> +       if (mtk_clk_mux_uses_hwv(init.ops) && !regmap_hwv) {
> +               return dev_err_ptr_probe(
> +                       dev, -ENXIO,
> +                       "regmap not found for hardware voter clocks\n");
> +       }

Nit: The braces aren't really needed. But no need to respin just for this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

