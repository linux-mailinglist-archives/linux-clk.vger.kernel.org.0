Return-Path: <linux-clk+bounces-26138-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93524B27701
	for <lists+linux-clk@lfdr.de>; Fri, 15 Aug 2025 05:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 471F65E4191
	for <lists+linux-clk@lfdr.de>; Fri, 15 Aug 2025 03:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5392BDC32;
	Fri, 15 Aug 2025 03:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n6P0IZ3d"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15AD22068B
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755229342; cv=none; b=LSOELdZ0NY1/hbDIBreOvV3PF/v5IVeCem8LoR2SMPhnGh/pK7jEOR+H2ZoBYroAPrqJq9zxutZatr52AvspVEjr8qFYp8jdEWR8rdDSmG5Lvp7anxHLm6wVFANnLTlJsvlW/AoXShfn9iOquww7it7XKLYrK2+VtABR9A+lAkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755229342; c=relaxed/simple;
	bh=vsQ52WTwmO3+8ssw1w1cMYYmcVawrOSq6WzepbrpO70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nje0F2gPXPCESwPlJeWnfbtEvgtrsJ8t7vsQBf3BudgbEQtgguO4oDABqnUr4nkbW525r54hLHAeOgwcofTyDOSSpygXy3lCnX/wYBuH9FyOlXppN49A+lrEIHmp/hcemvwW2I7ZF500C68R1V3O0YS62CxlMkXxTpQveG1Ja+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n6P0IZ3d; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce5284d63so1448444e87.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 20:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229337; x=1755834137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=;
        b=n6P0IZ3dVwDyLuzIVnFEG9e8AzVR+RUueC+3GZKs95LqUkbTrECHkRIKM74+Q0KBfE
         IaXH4cTmi6cQ5ePzxrRKjW24eg6mn/tfbtZBy8BLLzZBU8+OA4WjUcpM/PIA114pFehW
         WCKday2Y/RZxYJoSYcI8ZSUe/4+RCpKFcy8rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229337; x=1755834137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLAZnsZy8mysFSYeQu/zRgcIgupbd8f4aYQXFFI2MWI=;
        b=kyZxHoHZQE0Ni23MQjqkB4WO/6f5VdwMXOjOaPLskfF0JAhl3/btTex16St7Z0/HuT
         nxeTu2Sqxa0wb/ZO2FIOg/pFF6vqAHH/xRssz4/QIe19eKjNpcTRM0NYszjvs6y+evyd
         ubZ8PT6KnTcLR8cfuo3zfN2wbZrxDzWVBe1FdIl72nptYpI/N3Mmc+95v7BcZGN4wTd9
         vDChxzJlThjwDisRdmaaXiPoerJU+PQ8VGOWOMV4VGX1OOl67PQVAkwv+AFpOZoiUYJa
         Kv5qdmByFkuGTOGGeJ+MS6E09TZn9pPn3oNcm6WV+/1PBfC+/4xu5UCXCh/F5sBpI67N
         qNLw==
X-Forwarded-Encrypted: i=1; AJvYcCWESz15VgwJoZnW4jR7Mnho0ML0cb7hUOUUi9qPNaOWdvN66UHuSxlHgARmL/VmwC4E9hsNxfOiQnU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CaRzBMM0G1ecYk76gmyhHcW04Jy6Q5DdXdG1NfrQ4wXWQFKd
	8szr7lwPp5WZhKony2du7PVniELWSg9u2pqEsr2QFk1awnWS7q3QCgfoJuCc29w53VoHUoqAjoE
	k6FzhA23tU7DORX+ZCg01HRdl4XuTAhKU5377kjoB
X-Gm-Gg: ASbGnctma5gD2TK7V1g1HWGzvopfCyVyT0eM7+xLtZi6lxIaGIftznTiKvGJhietNYJ
	kuafwLgW9H/W3Nz7uqoBqMlg9bQo3glnImHvLNJnt1z1NM/XLkMAKRf/KI0Z8L4SUZXeNGXIzch
	6cx8iUXx9GbHHj+zvXcSgReaqmHcW2EMFxnnBcBSjJ/DXATgNNlI+WNx5n3T46UTTeYUvcINrp+
	blQOaxRclaZuchS9qgx9idRLEe2odo2/hruqw==
X-Google-Smtp-Source: AGHT+IG4MHT9xlQA8q+aRzeI2TOWcXJ3eWM4zAEjXRmpGzb6++EC3UVO4G2WwSWQHvNm7WXOwl7nEj1UnHJTPSq8Yys=
X-Received: by 2002:a05:6512:230a:b0:55c:d6c9:38df with SMTP id
 2adb3069b0e04-55ce62cd258mr1499674e87.21.1755229337315; Thu, 14 Aug 2025
 20:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-7-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-7-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:42:06 +0900
X-Gm-Features: Ac12FXy2dCuPlbnz3eN56WS0B1sITUha0hiPx6j9G95oILsqMsxPgE4MrEBU4UM
Message-ID: <CAGXv+5GxJs03EcMt0jm-x_fDuy_RtCrnOmyJvVVgAP9O9R6E2Q@mail.gmail.com>
Subject: Re: [PATCH v4 06/27] clk: mediatek: clk-gate: Refactor
 mtk_clk_register_gate to use mtk_gate struct
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate instead of individual
> parameters, avoiding the need to add three extra arguments to support
> HW voter register offsets.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++---------------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-g=
ate.c
> index 67d9e741c5e7..0375ccad4be3 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -152,12 +152,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv =
=3D {
>  };
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>
> -static struct clk_hw *mtk_clk_register_gate(struct device *dev, const ch=
ar *name,
> -                                        const char *parent_name,
> -                                        struct regmap *regmap, int set_o=
fs,
> -                                        int clr_ofs, int sta_ofs, u8 bit=
,
> -                                        const struct clk_ops *ops,
> -                                        unsigned long flags)
> +static struct clk_hw *mtk_clk_register_gate(struct device *dev,
> +                                               const struct mtk_gate *ga=
te,
> +                                               struct regmap *regmap)
>  {
>         struct mtk_clk_gate *cg;
>         int ret;
> @@ -167,17 +164,17 @@ static struct clk_hw *mtk_clk_register_gate(struct =
device *dev, const char *name
>         if (!cg)
>                 return ERR_PTR(-ENOMEM);
>
> -       init.name =3D name;
> -       init.flags =3D flags | CLK_SET_RATE_PARENT;
> -       init.parent_names =3D parent_name ? &parent_name : NULL;
> -       init.num_parents =3D parent_name ? 1 : 0;
> -       init.ops =3D ops;
> +       init.name =3D gate->name;
> +       init.flags =3D gate->flags | CLK_SET_RATE_PARENT;
> +       init.parent_names =3D gate->parent_name ? &gate->parent_name : NU=
LL;
> +       init.num_parents =3D gate->parent_name ? 1 : 0;
> +       init.ops =3D gate->ops;
>
>         cg->regmap =3D regmap;
> -       cg->set_ofs =3D set_ofs;
> -       cg->clr_ofs =3D clr_ofs;
> -       cg->sta_ofs =3D sta_ofs;
> -       cg->bit =3D bit;
> +       cg->set_ofs =3D gate->regs->set_ofs;
> +       cg->clr_ofs =3D gate->regs->clr_ofs;
> +       cg->sta_ofs =3D gate->regs->sta_ofs;
> +       cg->bit =3D gate->shift;

I'd rather see |struct mtk_clk_gate| (the runtime data) gain a pointer
to the static data |struct mtk_gate| instead of doing all the copying.
This is just needless duplication.

ChenYu

>         cg->hw.init =3D &init;
>
> @@ -228,13 +225,7 @@ int mtk_clk_register_gates(struct device *dev, struc=
t device_node *node,
>                         continue;
>                 }
>
> -               hw =3D mtk_clk_register_gate(dev, gate->name, gate->paren=
t_name,
> -                                           regmap,
> -                                           gate->regs->set_ofs,
> -                                           gate->regs->clr_ofs,
> -                                           gate->regs->sta_ofs,
> -                                           gate->shift, gate->ops,
> -                                           gate->flags);
> +               hw =3D mtk_clk_register_gate(dev, gate, regmap);
>
>                 if (IS_ERR(hw)) {
>                         pr_err("Failed to register clk %s: %pe\n", gate->=
name,
> --
> 2.39.5
>

